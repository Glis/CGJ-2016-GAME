# == Schema Information
#
# Table name: minions
#
#  id           :integer          not null, primary key
#  name         :string
#  game_id      :integer
#  game_word_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  position     :integer
#

class Minion < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_word

  def as_json(options={})
    {
      position:self.position,
      name:self.name,
      word:self.game_word.word.name
    }
  end
end
