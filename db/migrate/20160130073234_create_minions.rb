class CreateMinions < ActiveRecord::Migration
  def change
    create_table :minions do |t|
      t.string :name
      t.references :game, index: true, foreign_key: true
      t.references :game_word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
