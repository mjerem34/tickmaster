# unbind_field_type_user.rb
class UnbindFieldTypeUser
  def initialize(params:, id:)
    @id = id
    @type_user_id = params[:type_user_id]
  end

  def call
    field_type_user_type_users.tap(&:destroy_all)
    field_users.tap(&:destroy_all)
  end

  private

  def field_type_user
    @field_type_user ||= FieldTypeUser.find(@id)
  end

  def type_user
    @type_user ||= TypeUser.find(@type_user_id)
  end

  def field_type_user_type_users
    field_type_user
      .field_type_user_type_users
      .where(type_user_id: type_user.id)
  end

  def field_users
    field_type_user
      .field_users
      .joins(:user)
      .where('users.type_user_id' => type_user.id)
  end
end
