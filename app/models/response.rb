class Response < ActiveRecord::Base
  belongs_to :incident
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  has_many :file_responses, dependent: :destroy
  accepts_nested_attributes_for :file_responses, allow_destroy: true
  has_many :file_archives
  accepts_nested_attributes_for :file_archives, allow_destroy: true

  IP_REGEXP = /\A(?:(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\z/

  validates :content, presence: true, length: { in: 0..65_534 }
  validates :ip_adress_sender, presence: true, format: { with: IP_REGEXP }
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :incident_id, presence: true

  def downloadable?(user)
    user != :guest
  end
end
