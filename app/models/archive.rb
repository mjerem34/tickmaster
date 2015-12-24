# == Schema Information
#
# Table name: archives
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

class Archive < ActiveRecord::Base
  belongs_to :user
  belongs_to :incident
  has_many :files_archives
  accepts_nested_attributes_for :files_archives, allow_destroy: true
end
