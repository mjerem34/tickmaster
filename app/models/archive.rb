class Archive < ActiveRecord::Base
  belongs_to :user
  belongs_to :incident
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  has_many :files_archives
  accepts_nested_attributes_for :files_archives, allow_destroy: true

  IP_REGEXP = /\A(?:(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\z/

  validates :content, presence: true, length: { in: 0..65_535 }
  validates :ip_address_sender, presence: true, length: { in: 0..20 }, format: { with: IP_REGEXP }
  validates :sender_id, presence: true
  validates :incident_id, presence: true
end
