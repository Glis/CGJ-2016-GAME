# == Schema Information
#
# Table name: game_words
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  word_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GameWord < ActiveRecord::Base
  belongs_to :game
  belongs_to :word
  has_one :minion
end
