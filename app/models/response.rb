# response.rb
class Response < ActiveRecord::Base
  belongs_to :incident
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  IP_REGEXP = /\A(?:(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\z/

  validates :content, presence: true, length: { in: 0..65_534 }
  validates :ip_address_sender, presence: true, format: { with: IP_REGEXP }
  validates :sender_id, presence: true
  validates :incident_id, presence: true
end
