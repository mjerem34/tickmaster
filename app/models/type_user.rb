class TypeUser < ActiveRecord::Base
  has_many :field_type_user_type_users, dependent: :destroy
  has_many :field_type_users, through: :field_type_user_type_users
  has_many :users

  has_many :type_user_rights, dependent: :destroy
  has_many :rights, through: :type_user_rights

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }, length: { in: 0..254 }
  validates :secure, :is_tech, :actif, inclusion: { in: [true, false] }
end