class GameController < ApplicationController
  def index
  end

  def new
    game = Game.setup
    player_turn = game.player_1 == game.player
    render json: GameStateFormatter.format(game, player_turn)
  end

  def computer_move
    game = Game.find(params[:id])
    game.board = Board.new(cells: board_params)

    game = AiDecisionService.updated_board_state(game) unless game.board.gameover?

    render json: GameStateFormatter.format(game)
  end

  private

  def board_params
    params[:board].map { |c| c.empty? ? nil : c }
  end
end