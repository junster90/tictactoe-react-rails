class GameController < ApplicationController
  def index
  end

  def new
    game = Game.setup
  end

end