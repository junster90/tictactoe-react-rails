class GameStateFormatter
  def self.format(game, message)
    winner = 'tie' if game.board.tie? || game.board.winner

    {
      gameover: game.board.gameover?,
      player: game.player,
      computer: game.computer,
      winner: winner,
      playerTurn: game.current_player == game.player,
      board: game.board.cells,
      message: message
    }
  end
end