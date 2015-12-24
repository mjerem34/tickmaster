# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  pseudo     :string(255)
#  email      :string(255)
#  name       :string(255)
#  surname    :string(255)
#  ip_adress  :integer
#  salt       :string(255)
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tech      :boolean          default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
