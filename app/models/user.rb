class User < ActiveRecord::Base
  module Usermod
    attr_accessor :pseudo, :id, :email, :name, :surname, :tel, :mobile, :tech_id, :agency_id, :mode
  end

  has_many :user_incidents, class_name: 'Incident', foreign_key: 'user_id'
  has_many :tech_incidents, class_name: 'Incident', foreign_key: 'tech_id'
  has_many :files_users
  accepts_nested_attributes_for :files_users, allow_destroy: true
  has_many :responses
  has_many :archives
  has_many :rights
  belongs_to :agency
  belongs_to :tech

  # Regexp for the email.
  email_regexp = /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{2,}\.[a-zA-Z]{2,4}$\z/
  # Regexp for the pseudo.
  pseudo_regexp = /\A([a-zA-Z0-9._-]{2,36})\z/
  # Regexp for the phone number.
  phone_regexp = /\A^0[0-9]([ .-]?[0-9]{2}){4}\z/
  validates :pseudo, presence: true,
                     format: { with: pseudo_regexp },
                     uniqueness: { case_sensitive: false }, length: { in: 0..49 }
  validates :name, presence: true, length: { in: 0..100 }
  validates :surname, presence: true, length: { in: 0..100 }
  validates :tech_id, presence: true
  validates :agency_id, presence: true

  validates :tel, presence: true,
                  format: { with: phone_regexp }, length: { in: 0..30 }

  validates :email, presence: true,
                    format: { with: email_regexp }

  def self.authenticate(pseudo, password)
    user = find_by_pseudo(pseudo)
      !user.nil? && password == user.password ? user : nil
  end
  before_save { |user| user.pseudo.downcase! }
  before_save { |user| user.email.downcase! }
  before_save { |user| user.name.capitalize! }
  before_save { |user| user.surname.capitalize! }
  before_create {|user| user.mode = "Jour"}

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
end
