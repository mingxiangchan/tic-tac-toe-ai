require 'rails_helper'

RSpec.describe TicTacToeGame, type: :model do
  let(:game){ TicTacToeGame.new }
  
  describe '#initialize' do
    it 'should generate a valid board with 3x3 grid' do
      expect(game.board.length).to eq(3)
      game.board.each do |row|
        expect(row.length).to eq(3)
      end
    end
  end
end
