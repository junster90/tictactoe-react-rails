class GameController < ApplicationController
  def index
  end

  def new
    game = Game.setup
    message = "Welcome to Tic-Tac-Toe. #{game.current_player.upcase} starts first."
    render json: GameStateFormatter.format(game, message)
  end

end