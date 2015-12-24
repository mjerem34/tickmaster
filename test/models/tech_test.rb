# == Schema Information
#
# Table name: teches
#
#  id         :integer          not null, primary key
#  pseudo     :string(255)
#  password   :string(255)
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TechTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
