class PlayersController < ApplicationController
  def index
    @model = Player
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