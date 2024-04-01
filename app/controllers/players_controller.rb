# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
