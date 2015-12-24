class Agency < ActiveRecord::Base
  module Agencymod
    attr_accessor :name, :adress, :adress2, :adress3, :cp, :city, :email, :tel, :fax, :department, :ip_adress
  end
  has_many :users
  has_many :incidents

  cp_regexp = /\A((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}\z/
  email_regexp = /\A[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$\z/
  phone_regexp = /\A(0|\+33|0033)[1-9][0-9]{8}\z/
  ip_regexp = /\A(?:(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}(?:[1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\z/

  validates :name, presence: true,
                    uniqueness: {:case_sensitive => false}, length: { in: 0..44}

  validates :adress, presence: true,
                    uniqueness: {:case_sensitive => false}, length: { in: 0..99}
  validates :adress2, length: { in: 0..99}
  validates :adress3, length: { in: 0..99}
  validates :cp, presence: true, format: {with: cp_regexp}, length: { in: 0..19}
  validates :city, presence: true, length: { in: 0..44}
  validates :email, presence: true, format: {with: email_regexp}, length: { in: 0..44}
  validates :tel, presence: true, format: {with: phone_regexp},
                    uniqueness: {:case_sensitive => false}, length: { in: 0..19}

  validates :fax, presence: true,
                    uniqueness: {:case_sensitive => false}, format: {with: phone_regexp}, length: { in: 0..19}

  validates :department, presence: true, length: { in: 0..19}
  validates :ip_adress, presence: true, format: {with: ip_regexp}, length: { in: 0..49}

end
