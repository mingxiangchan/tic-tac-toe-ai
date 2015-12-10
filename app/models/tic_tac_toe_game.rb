class TicTacToeGame < ActiveRecord::Base
  def initialize
    super
    self.board = Array.new(3){ Array.new(3) }
  end
end
