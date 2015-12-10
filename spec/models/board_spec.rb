require 'rails_helper'

describe Board do
  let(:board) { Board.new }

  describe 'initialize' do
    it 'should generate a valid board with 3x3 grid' do
      expect(board.grid.length).to eq(3)
      board.grid.each do |row|
        expect(row.length).to eq(3)
      end
    end
  end

  
end