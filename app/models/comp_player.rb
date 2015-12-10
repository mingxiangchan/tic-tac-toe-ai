class CompPlayer
  attr_reader :player_id

  def initialize(player_id)
    @player_id = player_id
  end
  
  def get_best_move(game)
    return score(game) if 
      game.board.available_spaces.each do |cell|
    end
  end
end

# set the computer_player's id
# iterate through each available space
# calculate the max score for each empty space
