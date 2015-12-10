class CompPlayer
  attr_reader :player_id

  def initialize(player_id)
    @player_id = player_id
  end

  def opponent_id(current_player)
    return 1 if current_player == 2
    return 2 if current_player == 1
  end

  def score(board)
    return -10  if board.find_winner == opponent_id(@player_id)
    return 10 if board.find_winner == @player_id
    return 0
  end
  
  def get_best_move(board, depth=0, current_player)
    return score(board) if board.find_winner || board.tie?
    # store all scores of this board
    move_scores = {}

    #get rank for each available cell
    board.available_spaces.each do |cell|
      # play move on this cell
      board.play_move(player: current_player, position: cell)
      # check score for this move
      move_scores[cell] = get_best_move(board, depth +1 , opponent_id(current_player))
      # reset board
      board.reset_space(cell)
    end

    best_move = best_move(current_player, move_scores)
    return best_move[0] if depth == 0 # return best move position if at initial board in stack
    return best_move[1] if depth > 0# score for the best_move
  end

  def best_move(current_player, scores)
    if current_player == @player_id
      scores.max_by { |_k, v| v }
    else
      scores.min_by { |_k, v| v }
    end
  end
end
