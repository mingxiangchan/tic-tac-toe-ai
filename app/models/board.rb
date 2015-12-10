class Board
  attr_accessor :grid

  def initialize(grid=nil)
    grid ||= Array.new(3){ Array.new(3){" "}}
    @grid = grid
  end

  def winner_exists?
    winning_pattern =
      [
        [0,1,2], # horizontal rows
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7], # vertical rows
        [2,5,8],
        [0,4,8], # diagonal patterns
        [2,4,6] 
      ]
  end

  def tie?
    return false if @grid.flatten.include?(" ")
    return false if winner_exists?
    return true
  end
end