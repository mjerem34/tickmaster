class FieldTypeUser < ActiveRecord::Base
  has_many :field_users
  has_many :users, through: :field_users

  has_many :field_type_user_type_users, dependent: :destroy
  has_many :type_user, through: :field_type_user_type_users
end
