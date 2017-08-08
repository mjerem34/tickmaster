require 'securerandom'
require 'digest'
# app/model/user.rb
class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

  before_save :set_email_downcase
  before_create :set_user_actif

  belongs_to :type_user, foreign_key: :type_user_id
  belongs_to :agency

  has_many :user_incidents, class_name: 'Incident', foreign_key: 'user_id'
  has_many :tech_incidents, class_name: 'Incident', foreign_key: 'tech_id'
  has_many :files_users
  has_many :responses, foreign_key: 'sender_id', dependent: :destroy
  has_many :archives, foreign_key: 'sender_id', dependent: :destroy
  has_many :field_users, dependent: :destroy
  has_many :field_type_users, through: :field_users
  has_many :incidents

  accepts_nested_attributes_for :files_users, allow_destroy: true

  delegate :can?, to: :rights_manager

  EMAIL_REGEXP = /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{2,}\.[a-zA-Z]{2,4}$\z/
  PSEUDO_REGEXP = /\A([a-zA-Z0-9._-]{2,36})\z/
  PHONE_REGEXP = /\A^0[0-9]([ .-]?[0-9]{2}){4}\z/

  # Validations
  validates :type_user_id, presence: true
  validates :surname, presence: true
  validates :name, presence: true
  validates :agency_id, presence: true
  validates :tel, presence: true,
                  format: { with: PHONE_REGEXP }, length: { in: 0..30 }

  validates :email, presence: true,
                    format: { with: EMAIL_REGEXP },
                    length: { in: 0..254 },
                    uniqueness: { case_sensitive: false }
  # validates :crypted_password, presence: true

  # Methods

  def set_email_downcase
    email.downcase!
  end

  def set_user_actif
    self.actif = true
  end

  def rights_manager
    @rights_manager ||= RightsManager.new(self, nil)
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self).deliver_now
  end
end
