# frozen_string_literal: true

class Player < ApplicationRecord
  validates :name, presence: true
  validates :total_points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
