class FieldUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :field_type_user
end
