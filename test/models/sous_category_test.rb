# == Schema Information
#
# Table name: sous_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SousCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
