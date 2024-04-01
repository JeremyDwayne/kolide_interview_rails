# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table(:players) do |t|
      t.string(:name)
      t.string(:description)
      t.string(:location)
      t.integer(:total_points)

      t.timestamps
    end
  end
end
