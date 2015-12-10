class Board
  attr_accessor :grid

  def initialize(grid=nil)
    grid ||= Array.new(9){" "}
    @grid = grid
  end

  def find_winner
    player_1_moves = []
    player_2_moves = []
    grid.each_with_index { |cell, index|
      player_1_moves << index if cell == "X"
      player_2_moves << index if cell == "O"
    }

    return 1 if winning_pattern.any? {|win_pat| 
      win_pat.all?{ |cell| player_1_moves.include?(cell) }
    }
    return 2 if winning_pattern.any? {|win_pat| 
      win_pat.all?{ |cell| player_2_moves.include?(cell) }
    }
    return nil
  end

  def winning_pattern
    [
      [0,1,2], # horizontal rows
      [3,4,5],
      [6,7,8],
      [0,3,6], # vertical rows
      [1,4,7], 
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
    return false if @grid.include?(" ") || winner_exists?
    return true
  end

  def play_move(move={})
    if move[:player] == 1
      @grid[move[:position]] = "X"
    elsif move[:player] == 2
      @grid[move[:position]] = "O"
    end   
  end

  def available_spaces
    available_spaces = []
    @grid.each_with_index{|cell, index| available_spaces << index if cell == " "}
    available_spaces
  end

  def reset_space(position)
    @grid[position] = " "
  end
end