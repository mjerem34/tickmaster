# field_type_user_type_user.rb
class FieldTypeUserTypeUser < ActiveRecord::Base
  belongs_to :type_user
  belongs_to :field_type_user
  validates_uniqueness_of :type_user_id, scope: [:field_type_user_id]
end
