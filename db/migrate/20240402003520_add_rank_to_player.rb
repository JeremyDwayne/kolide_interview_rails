# frozen_string_literal: true

class AddRankToPlayer < ActiveRecord::Migration[6.1]
  def up
    add_column(:players, :rank, :integer)
    change_column_default(:players, :rank, 0)
  end

  def down
    remove_column(:players, :rank)
  end
end
