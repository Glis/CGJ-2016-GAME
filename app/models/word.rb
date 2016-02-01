# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Word < ActiveRecord::Base

  def self.get_random_record
    self.order("RAND()").first
  end

  def self.get_random_record_without words
    self.where("name NOT IN (?)", words).order("RAND()").first
  end

end
