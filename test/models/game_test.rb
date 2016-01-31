# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  points           :integer
#  token            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  minions_quantity :integer
#  status           :integer          default(0)
#  time             :integer          default(0)
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
