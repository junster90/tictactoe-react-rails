class Game
  attr_reader :player, :computer
  attr_accessor :board, :current_player

  def self.setup
    game = self.new(board: Board.new)
    return game
  end

  def initialize(board)
    @player, @computer = randomize_markers
    @current_player = randomize_starting_player
    @board = board
  end

  private
  
  def randomize_markers
    ["x", "o"].shuffle
  end

  def randomize_starting_player
    @current_player = [player, computer].sample
  end
end
