class AiDecisionService
  def self.updated_board_state(game)
    ai = AI.new
    ai_decision = ai.negamax(game.board, game.player_1, game.player_2)
    game.board.place_marker(game.computer, ai_decision)
    return game
  end
end