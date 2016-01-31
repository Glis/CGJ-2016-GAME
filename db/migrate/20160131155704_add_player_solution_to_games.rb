class AddPlayerSolutionToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_solution, :string
  end
end
