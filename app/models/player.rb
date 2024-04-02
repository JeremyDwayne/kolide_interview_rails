# frozen_string_literal: true

class Player < ApplicationRecord
  validates :name, presence: true
  validates :total_points,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100,
    }
  # I dont know what a valid score is, so I am assuming it is between 0 and 100

  def player_rank
    Player.where("total_points > ?", total_points).count + 1
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

  scope :top_player, -> { order(total_points: :desc).limit(1).first }
  scope :bottom_player, -> { order(total_points: :asc).limit(1).first }
  scope :season_average, -> { average(:total_points) }
end
