# frozen_string_literal: true

class AwardsPlayer < ApplicationRecord
  belongs_to :award
  belongs_to :player
end
