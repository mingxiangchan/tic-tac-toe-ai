class Board
  attr_accessor :grid

  def initialize(grid=nil)
    grid ||= Array.new(3){ Array.new(3){" "}}
    @grid = grid
  end

  def winner_exists?
  end

  def tie?
    return false if winner_exists?
    return false if @grid.flatten.include?(" ")
    return true
  end
end