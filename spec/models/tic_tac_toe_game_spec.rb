require 'rails_helper'

describe TicTacToeGame do
  let(:game){ TicTacToeGame.new }
  
  describe '#initialize' do
    it 'should generate a board' do
      expect(game.board).to be_a(Board)
    end
  end

  describe '#game_over' do
    it 'should return true if tie' do
      allow(game.board).to receive(:winner_exists?).and_return(false)
      allow(game.board).to receive(:tie?).and_return(true)
      expect(game.game_over?).to be true
    end

    it 'should return true if winner exists' do
      allow(game.board).to receive(:winner_exists?).and_return(true)
      allow(game.board).to receive(:tie?).and_return(false)
      expect(game.game_over?).to be true
    end

    it 'should return false if no winner and there are possible moves' do
      allow(game.board).to receive(:winner_exists?).and_return(false)
      allow(game.board).to receive(:tie?).and_return(false)
      expect(game.game_over?).to be false
    end
  end
end
