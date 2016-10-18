class User < ActiveRecord::Base
  module Usermod
    attr_accessor :pseudo, :type_user_id, :password, :ip_addr, :email, :tel, :salt, :sys_msg, :actif, :mode, :agency_id
  end

  has_many :user_incidents, class_name: 'Incident', foreign_key: 'user_id'
  has_many :tech_incidents, class_name: 'Incident', foreign_key: 'tech_id'
  has_many :files_users
  accepts_nested_attributes_for :files_users, allow_destroy: true
  has_many :responses
  has_many :archives
  has_many :rights
  belongs_to :agency
  has_many :field_users, dependent: :destroy
  has_many :field_type_users, through: :field_users
  belongs_to :type_user, foreign_key: :type_user_id

  # Regexp for the email.
  email_regexp = /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{2,}\.[a-zA-Z]{2,4}$\z/
  # Regexp for the pseudo.
  pseudo_regexp = /\A([a-zA-Z0-9._-]{2,36})\z/
  # Regexp for the phone number.
  phone_regexp = /\A^0[0-9]([ .-]?[0-9]{2}){4}\z/

  # Validations
  validates :pseudo, presence: true,
                     format: { with: pseudo_regexp },
                     uniqueness: { case_sensitive: false }, length: { in: 0..49 }
  validates :type_user_id, presence: true
  validates :agency_id, presence: true
  validates :tel, presence: true,
                  format: { with: phone_regexp }, length: { in: 0..30 }

  validates :email, presence: true,
                    format: { with: email_regexp }

  # Methods
  def self.authenticate(pseudo, password)
    user = find_by_pseudo(pseudo)
    !user.nil? && password == user.password ? user : nil
  end
  before_save { |user| user.pseudo.downcase! }
  before_save { |user| user.email.downcase! }

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    user && user.salt == cookie_salt ? user : nil
  end
end
