class Minion < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_word
end
