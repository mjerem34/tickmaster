class Agency < ActiveRecord::Base
  has_many :users
  has_many :incidents
  has_many :field_agency_agencies, dependent: :destroy
  has_many :field_agencies, through: :field_agency_agencies

  # # Regexp for the postal code.
  # cp_regexp = /\A((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}\z/
  # # Regexp for email.
  # email_regexp = /\A[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$\z/
  # # Regexp for phone number.
  # phone_regexp = /\A(0|\+33|0033)[1-9][0-9]{8}\z/
  # # Regexp for ip address.
  IP_REGEXP = /\A(?:(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\z/

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :ip_adress, presence: true, format: { with: IP_REGEXP }
end
