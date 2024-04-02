# frozen_string_literal: true

class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy, :update_rank]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to(player_url(@player), notice: "Player was successfully created.") }
        format.json { render(:show, status: :created, location: @player) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @player.errors, status: :unprocessable_entity) }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to(player_url(@player), notice: "player was successfully updated.") }
        format.json { render(:show, status: :ok, location: @player) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @player.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy!

    respond_to do |format|
      format.html { redirect_to(players_url, notice: "Player was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  def update_rank
    @player.update_rank

    redirect_to(@player)
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :description, :location, :total_points)
  end
end
