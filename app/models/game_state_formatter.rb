class GameStateFormatter
  def self.format(game, player_turn)

    if game.board.clean?
      message = "Welcome to Tic-Tac-Toe. #{game.player_1.upcase} starts first."
    elsif game.board.tie?
      winner = "tie"
      message = "It's a draw! Play again?"
    elsif game.board.winner
      winner = game.board.winner
      message = "#{winner.upcase} won! Play again?"
    else
      message = "Computer made it's choice. Your turn."
    end

    return {
      id: game.id,
      gameover: game.board.gameover?,
      player: game.player,
      computer: game.computer,
      winner: winner || nil,
      playerTurn: player_turn,
      board: game.board.cells,
      message: message
    }
  end
end