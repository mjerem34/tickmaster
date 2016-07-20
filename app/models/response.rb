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

class Response < ActiveRecord::Base
  has_many :users
  belongs_to :user
  belongs_to :incident
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :file_responses, dependent: :destroy
  accepts_nested_attributes_for :file_responses, allow_destroy: true
  has_many :file_archives
  accepts_nested_attributes_for :file_archives, allow_destroy: true

  module ResponseMod
    attr_accessor :content
  end

  validates :content, presence: true
  def downloadable?(user)
    user != :guest
  end
end
