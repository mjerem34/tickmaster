# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  pseudo     :string(255)
#  email      :string(255)
#  name       :string(255)
#  surname    :string(255)
#  ip_adress  :integer
#  salt       :string(255)
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tech      :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  module Usermod
    attr_accessor :pseudo, :id, :email, :name, :surname, :tel, :mobile, :tech_id, :agency_id
  end

  has_many :incidents
  has_many :files_users
  accepts_nested_attributes_for :files_users, allow_destroy: true
  has_many :responses
  has_many :archives
  has_many :rights
  belongs_to :agency
  belongs_to :tech

  email_regexp = /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]{2,}\.[a-zA-Z]{2,4}$\z/
  pseudo_regexp = /\A([a-zA-Z0-9._-]{2,36})\z/
  phone_regexp = /\A^0[0-9]([ .-]?[0-9]{2}){4}\z/
  validates :pseudo, presence: true,
                     format: { with: pseudo_regexp },
                     uniqueness: { case_sensitive: false }, length: { in: 0..49 }
  validates :name, presence: true, length: { in: 0..19 }
  validates :surname, presence: true, length: { in: 0..19 }
  validates :tech_id, presence: true
  validates :agency_id, presence: true

  validates :tel, presence: true,
                  format: { with: phone_regexp }, length: { in: 0..30 }

  # validates :mobile, presence: true,
  #                format: {with: phone_regexp},
  #                uniqueness: true
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

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
end
