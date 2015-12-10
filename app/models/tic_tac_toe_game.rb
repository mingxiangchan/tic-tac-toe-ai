require_relative 'board'
require_relative 'comp_player'
require 'byebug'

class TicTacToeGame
  attr_accessor :board, :current_player

  def game_over?
    return true if self.board.winner_exists? || self.board.tie?
    return false
  end

  def start_new_game
    @board = Board.new
    @current_player = 1
    puts "You are Player 1, the computer is Player 2, the game begins now!"
  end

  def set_board(board)
    @board = Board.new(board)
  end

  def switch_player
    if @current_player == 1
      @current_player = 2
    elsif @current_player == 2 
     @current_player = 1
    end
  end

  def puts_board
    @board.grid.each_slice(3){ |row| p row }
  end

  def play
    until game_over?
      puts_board
      puts "Play your move(insert 0-8 depending on array index)"
      input = gets.chomp
      @board.play_move(player: @current_player, position: input.to_i)
      break if game_over?
      puts_board
      puts "Please wait while the computer makes its move"
      switch_player
      comp = CompPlayer.new(@current_player)
      comp_move = comp.get_best_move(@board, 0, @current_player)
      @board.play_move(player: @current_player, position: comp_move)
      switch_player
    end
    puts "Tie!" if @board.tie?
    puts "Player #{board.find_winner} won!" if @board.find_winner
  end
end

game = TicTacToeGame.new
game.start_new_game
game.play