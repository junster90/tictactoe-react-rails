class GameStateFormatter
  def self.format(game, player_turn = true)

    if game.board.clean?
      message = "Welcome to Tic-Tac-Toe. #{game.player_1.upcase} starts first."
    elsif game.board.tie?
      message = "It's a tie! Play again?"
    elsif game.board.winner
      message = "#{game.board.winner.upcase} won! Play again?"
    else
      message = "Computer made it's choice. Your turn."
    end

    player_turn = false if game.board.gameover?

    return {
      id: game.id,
      gameover: game.board.gameover?,
      player: game.player,
      computer: game.computer,
      playerTurn: player_turn,
      board: game.board.cells,
      message: message
    }
  end
end