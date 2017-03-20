class TypeUserRight < ActiveRecord::Base
  module TypeUserRightMod
    attr_accessor :right_id, :type_user_id, :value
  end
  belongs_to :right
  belongs_to :type_user
end
