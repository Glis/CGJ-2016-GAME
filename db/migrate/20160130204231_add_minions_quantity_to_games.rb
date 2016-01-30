class AddMinionsQuantityToGames < ActiveRecord::Migration
  def change
    add_column :games, :minions_quantity, :integer
  end
end
