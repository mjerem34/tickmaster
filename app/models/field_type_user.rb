class FieldTypeUser < ActiveRecord::Base
  has_many :field_users
  has_many :users, through: :field_users
  belongs_to :type_user, foreign_key: :type_user_id
end
