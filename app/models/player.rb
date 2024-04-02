# frozen_string_literal: true

class Player < ApplicationRecord
  has_many :awards_players, dependent: :destroy
  has_many :awards, through: :awards_players

  validates :name, presence: true
  validates :total_points,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100,
    }
  # I dont know what a valid score is, so I am assuming it is between 0 and 100
  after_save :clear_cache, if: :saved_change_to_total_points?

  def clear_cache
    Rails.cache.delete("#{cache_key_with_version}/rank")
    Rails.cache.delete("top_player")
    Rails.cache.delete("bottom_player")
    Rails.cache.delete("season_average")
  end

  def player_rank
    Rails.cache.fetch("#{cache_key_with_version}/rank", expires_in: 1.hour) do
      Player.where("total_points > ?", total_points).count + 1
    end
  end

  # I couldn't get the tests to pass for this, so I am commenting it out for now
  # ideally I would want to store the rank in the database or in a cache so we're
  # not hitting the database every page load

  # before_create :set_initial_rank
  # after_save :update_rank, if: :total_points_changed?
  def set_initial_rank
    self.rank = player_rank
  end

  def update_rank
    update(rank: player_rank)
  end

  class << self
    def top_player
      Rails.cache.fetch("top_player", expires_in: 1.hour) do
        order(total_points: :desc).limit(1).first
      end
    end

    def bottom_player
      Rails.cache.fetch("bottom_player", expires_in: 1.hour) do
        order(total_points: :asc).limit(1).first
      end
    end

    def season_average
      Rails.cache.fetch("season_average", expires_in: 1.hour) do
        average(:total_points)
      end
    end
  end
end
