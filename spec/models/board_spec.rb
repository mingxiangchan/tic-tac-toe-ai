require 'rails_helper'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'should generate a valid board with 3x3 grid' do
      expect(board.grid.length).to eq(3)
      board.grid.each do |row|
        expect(row.length).to eq(3)
      end
    end
  end

  describe '#winner_exists?' do

  end

  describe '#tie?' do
    it 'should return false if winner exists' do
      allow(board).to receive(:winner_exists?).and_return(true)
      expect(board.tie?).to be false
    end

    it 'should return true if no empty spaces on board' do
      full_grid = "XXXXXXXXX".split("")
      board.grid = Array.new(3){full_grid.shift(3)}
      expect(board.tie?).to be true
    end
    it 'should return false if there are empty spaces on board' do
      not_full_grid = "XXXXXXXX ".split("")
      board.grid = Array.new(3){not_full_grid.shift(3)}
      expect(board.tie?).to be false
    end
  end
end