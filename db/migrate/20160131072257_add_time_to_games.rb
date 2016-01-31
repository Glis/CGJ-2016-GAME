class AddTimeToGames < ActiveRecord::Migration
  def change
    add_column :games, :time, :integer, default:0
  end
end
