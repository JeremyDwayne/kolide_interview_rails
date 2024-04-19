# frozen_string_literal: true

class CreateAwards < ActiveRecord::Migration[6.1]
  def change
    create_table(:awards) do |t|
      t.string(:name)

      t.timestamps
    end
    add_index(:awards, :name, unique: true)
    create_join_table(:awards, :players)
  end
end
