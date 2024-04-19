# frozen_string_literal: true

class Award < ApplicationRecord
  has_many :awards_players, dependent: :destroy
  has_many :players, through: :awards_players

  validates :name, presence: true, uniqueness: true
end
