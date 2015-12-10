require_relative 'board'

class TicTacToeGame
  attr_accessor :board
  
  def initialize
    self.board = Board.new
  end

end
