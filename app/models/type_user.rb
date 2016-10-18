class TypeUser < ActiveRecord::Base
  has_many :field_type_users
  has_many :users

  has_many :type_user_rights, dependent: :destroy
  has_many :rights, through: :type_user_rights
end
