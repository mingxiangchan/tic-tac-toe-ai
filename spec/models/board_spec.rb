require 'rails_helper'

def create_winning_grid(winning_pattern)
  rand_win_pattern = winning_pattern[rand(0..7)]
  winning_grid = []
  9.times {|i|
    if rand_win_pattern.include?(i) 
      winning_grid << "X"
    else
      winning_grid << " "
    end
  }
  winning_grid
end

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    let(:input_grid) { ["X","X"," "," "," "," "," "," "," "]}

    it 'should generate a valid board with 3x3 grid' do
      expect(board.grid.length).to eq(9)
    end

    it 'should generate the correct grid based on input array' do
      new_board = Board.new(input_grid)
      expect(new_board.grid).to eq(input_grid)
    end
  end

  describe '#winner_exists?' do
    it 'should return true if winning pattern is found' do
      winning_board = Board.new(create_winning_grid(board.winning_pattern))
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
      board.grid = "XXXXXXXXX".split("") 
      allow(board).to receive(:winner_exists?).and_return(false)
      expect(board.tie?).to be true
    end
    it 'should return false if there are empty spaces on board' do
      board.grid = "XXXXXXXX ".split("")
      expect(board.tie?).to be false
    end
  end

  describe '#find_winner' do
    it 'should return 1 if player 1 won' do
      winning_board = Board.new(create_winning_grid(board.winning_pattern))
      expect(winning_board.find_winner).to eq(1)
    end

    it 'should return 2 if player 2 won' do
      winning_board = Board.new(create_winning_grid(board.winning_pattern))
      winning_board.grid = winning_board.grid.each{|value| value.gsub!("X", "O")}
      expect(winning_board.find_winner).to eq(2)
    end

    it 'should return false if no player won' do
      expect(board.find_winner).to be false
    end
  end

  describe 'play_move' do
    it 'should place the move on the correct board position' do
      position = rand(0..8)
      board.play_move(player: 1, position: position)
      expect(board.grid[position]).to eq("X")
    end

    it 'should place the correct players move on the board' do
      position = rand(0..8)
      board.play_move(player: 2, position: position)
      expect(board.grid[position]).to eq("O")
    end
  end
end