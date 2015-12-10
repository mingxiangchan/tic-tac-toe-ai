class CreateTicTacToeGames < ActiveRecord::Migration
  def change
    create_table :tic_tac_toe_games do |t|
      t.text :board, array: true, default: []

      t.timestamps null: false
    end
  end
end
