class Game < ActiveRecord::Base
  has_many :minions
  has_many :game_words


end
