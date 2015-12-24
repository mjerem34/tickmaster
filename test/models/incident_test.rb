# == Schema Information
#
# Table name: incidents
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  content           :text(4294967295)
#  user_id           :integer
#  tech_id       :integer
#  category_id       :integer
#  sous_category_id  :integer
#  evenement_type_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class IncidentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
