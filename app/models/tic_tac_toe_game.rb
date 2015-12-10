require_relative 'board'
require_relative 'comp_player'

class TicTacToeGame
  attr_accessor :board, :player

  def game_over?
    return true if self.board.winner_exists? || self.board.tie?
    return false
  end

  def start_new_game
    @board = Board.new
  end

  def set_board(board)
    @board = Board.new(board)
  end

  def current_player
    if @player == 1
      @player = 2
    else
      @player = 1
    end
    return 1 if @player == nil
    return @player
  end

  def play
    until game_over?
      @board.grid.each_slice(3){ |row| p row }
      puts "Play your move"
      input = gets.chomp
      @board.play_move(player: current_player, position: input.to_i)
    end
    puts "Tie!" if @board.tie?
    puts "Player #{board.find_winner} won!" if @board.find_winner
  end
end