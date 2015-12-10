class Board
  attr_accessor :grid

  def initialize(grid=nil)
    grid ||= Array.new(3){ Array.new(3){" "}}
    @grid = grid
  end

  def find_winner
    player_1_moves = []
    player_2_moves = []
    grid.flatten.each_with_index { |cell, index|
      player_1_moves << index if cell == "X"
      player_2_moves << index if cell == "O"
    }
    return 1 if winning_pattern.include?(player_1_moves)
    return 2 if winning_pattern.include?(player_2_moves)
    return false
  end

  def winning_pattern
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

  def winner_exists?
    return true if find_winner
    return false
  end

  def tie?
    return false if @grid.flatten.include?(" ")
    return false if winner_exists?
    return true
  end
end