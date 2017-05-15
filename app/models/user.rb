require 'securerandom'
require 'digest'
# app/model/user.rb
class User < ActiveRecord::Base
  before_save :set_pseudo_downcase
  before_save :set_email_downcase
  before_save :set_user_actif
  before_save :set_salt

  belongs_to :type_user, foreign_key: :type_user_id
  belongs_to :agency

  has_many :user_incidents, class_name: 'Incident', foreign_key: 'user_id'
  has_many :tech_incidents, class_name: 'Incident', foreign_key: 'tech_id'
  has_many :files_users
  has_many :responses, dependent: :destroy
  has_many :archives, dependent: :destroy
  has_many :field_users, dependent: :destroy
  has_many :field_type_users, through: :field_users

  accepts_nested_attributes_for :files_users, allow_destroy: true

  delegate :can?, to: :rights_manager

  EMAIL_REGEXP = /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{2,}\.[a-zA-Z]{2,4}$\z/
  PSEUDO_REGEXP = /\A([a-zA-Z0-9._-]{2,36})\z/
  PHONE_REGEXP = /\A^0[0-9]([ .-]?[0-9]{2}){4}\z/

  # Validations
  validates :pseudo, presence: true, format: { with: PSEUDO_REGEXP },
                     uniqueness: { case_sensitive: false },
                     length: { in: 0..49 }
  validates :type_user_id, presence: true
  validates :surname, presence: true
  validates :name, presence: true
  # validates :password, presence: true
  validates :agency_id, presence: true
  validates :tel, presence: true,
                  format: { with: PHONE_REGEXP }, length: { in: 0..30 }

  validates :email, presence: true,
                    format: { with: EMAIL_REGEXP }, length: { in: 0..254 }

  # Methods
  def self.authenticate(pseudo, password)
    user = find_by_pseudo(pseudo)
    nil if user.nil?
    if user.type_user.secure
      user if password == user.password
    else
      user
    end
  end

  def set_pseudo_downcase
    pseudo.downcase!
  end

  def set_email_downcase
    email.downcase!
  end

  def set_user_actif
    self.actif = true
  end

  def set_salt
    self.salt = Digest::SHA2.new(512).hexdigest SecureRandom.hex(32)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    user && user.salt == cookie_salt ? user : nil
  end

  def rights_manager
    @rights_manager ||= RightsManager.new(self, nil)
  end
end
