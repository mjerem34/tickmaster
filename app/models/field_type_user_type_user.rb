class FieldTypeUserTypeUser < ActiveRecord::Base
  belongs_to :type_user
  belongs_to :field_type_user
end
