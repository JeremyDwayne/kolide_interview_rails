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

  scope :top_player, -> { order(total_points: :desc).limit(1).first }
  scope :bottom_player, -> { order(total_points: :asc).limit(1).first }
  scope :season_average, -> { average(:total_points) }
end
