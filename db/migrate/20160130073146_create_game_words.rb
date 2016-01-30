class CreateGameWords < ActiveRecord::Migration
  def change
    create_table :game_words do |t|
      t.references :game, index: true, foreign_key: true
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
