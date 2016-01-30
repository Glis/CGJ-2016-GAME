class GameWord < ActiveRecord::Base
  belongs_to :game
  belongs_to :word
  has_one :minion
end
