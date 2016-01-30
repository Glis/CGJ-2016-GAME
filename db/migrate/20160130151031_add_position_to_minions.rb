class AddPositionToMinions < ActiveRecord::Migration
  def change
    add_column :minions, :position, :integer
  end
end
