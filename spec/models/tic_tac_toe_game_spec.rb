require 'rails_helper'

describe TicTacToeGame do
  let(:game){ TicTacToeGame.new }

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

  describe '#start_new_game' do
    it 'should generate a board' do
      game.start_new_game
      expect(game.board).to be_a(Board)
    end
  end

  describe '#current_player' do
    it 'is player 1 if no moves played' do
      expect(game.current_player).to eq(1)
    end

    it 'changes player id on next turn' do
      game.player = 1
      expect(game.current_player).to eq(2)
      game.player = 2
      expect(game.current_player).to eq(1)
    end
  end
end
