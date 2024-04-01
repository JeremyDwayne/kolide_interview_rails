# frozen_string_literal: true

class Player < ApplicationRecord
  validates :name, presence: true
  validates :total_points, presence: true, numericality: { only_integer: true }
end
