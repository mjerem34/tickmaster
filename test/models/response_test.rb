# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text(65535)
#  incident_id :integer
#  user_id     :integer
#  tech_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
