class Game < ApplicationRecord
  attr_accessor :board

  before_create :randomize_markers, :randomize_starting_player

  def self.setup
    game = self.create(board: Board.new)
    return game
  end

  def player_2
    player_1 == 'x' ? 'o' : 'x'
  end

  private

  def randomize_markers
    self.player, self.computer = ["x", "o"].shuffle
  end

  def randomize_starting_player
    self.player_1 = [self.player, self.computer].sample
  end
end
