class Board
  attr_accessor :grid
  
  def initialize
    self.grid = Array.new(3){ Array.new(3) }
  end
end