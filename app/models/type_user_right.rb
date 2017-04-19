class TypeUserRight < ActiveRecord::Base
  belongs_to :right
  belongs_to :type_user
end
