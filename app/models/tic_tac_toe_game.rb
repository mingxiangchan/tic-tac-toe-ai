require_relative 'board'

class TicTacToeGame
  attr_accessor :board

  def initialize
    self.board = Board.new
  end

  def game_over?
    return true if self.board.winner_exists? || self.board.tie?
    return false
  end
end
