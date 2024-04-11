# frozen_string_literal: true

class BackfillAddRankToPlayer < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def up
    Player.find_each do |player|
      player.update(rank: player.player_rank)
    end
  end
end
