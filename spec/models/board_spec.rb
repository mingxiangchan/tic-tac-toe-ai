require 'rails_helper'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    let(:input_grid) { [["X","X"," "],[" "," "," "],[" "," "," "]]}

    it 'should generate a valid board with 3x3 grid' do
      expect(board.grid.length).to eq(3)
      board.grid.each do |row|
        expect(row.length).to eq(3)
      end
    end

    it 'should generate the correct grid based on input array' do
      new_board = Board.new(input_grid)
      expect(new_board.grid).to eq(input_grid)
    end
  end

  describe '#winner_exists?' do
    let(:winning_pattern) {
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
    }

    def create_winning_grid(winning_pattern)
      rand_win_pattern = winning_pattern[rand(0..7)]
      winning_grid = []
      winning_grid_rows = []
      9.times {|i|
        if rand_win_pattern.include?(i) 
          winning_grid << "X"
        else
          winning_grid << " "
        end
      }
      winning_grid.each_slice(3) {|row| winning_grid_rows << row}
      winning_grid_rows
    end

    it 'should return true if winning pattern is found' do
      winning_board = Board.new(create_winning_grid(winning_pattern))
      expect(winning_board.winner_exists?).to be true
    end

    it 'should return false if winning pattern is not found' do
      expect(board.winner_exists?).to be false
    end
  end

  describe '#tie?' do
    it 'should return false if winner exists' do
      allow(board).to receive(:winner_exists?).and_return(true)
      expect(board.tie?).to be false
    end

    it 'should return true if no empty spaces on board' do
      full_grid = "XXXXXXXXX".split("")
      board.grid = Array.new(3){full_grid.shift(3)}
      allow(board).to receive(:winner_exists?).and_return(false)
      expect(board.tie?).to be true
    end
    it 'should return false if there are empty spaces on board' do
      not_full_grid = "XXXXXXXX ".split("")
      board.grid = Array.new(3){not_full_grid.shift(3)}
      expect(board.tie?).to be false
    end
  end
end