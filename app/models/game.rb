class Game < ApplicationRecord
  attr_accessor :board, :current_player

  before_create :randomize_markers
  after_create  :randomize_starting_player

  def self.setup
    game = self.create(board: Board.new)
    return game
  end

  private

  def randomize_markers
    self.player, self.computer = ["x", "o"].shuffle
  end

  def randomize_starting_player
    self.current_player = [self.player, self.computer].sample
  end
end
