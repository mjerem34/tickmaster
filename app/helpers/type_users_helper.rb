# type_users_helper.rb
module TypeUsersHelper
  def are_user_binded?(type_user_id, field_type_user_id)
    @field_type_user = FieldTypeUser.find(field_type_user_id)
    @type_user = TypeUser.find(type_user_id)
    User.where(type_user_id: @type_user.id).each do |user|
      return true if user
                     .field_users
                     .where(field_type_user_id: @field_type_user.id).exists?
    end
    false
  end
end
