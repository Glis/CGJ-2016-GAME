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
#

require 'test_helper'

class MinionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
