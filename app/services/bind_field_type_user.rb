# bind_field_type_user.rb
class BindFieldTypeUser
  def initialize(field_type_user_name, type_user_id)
    @field_type_user = FieldTypeUser
                       .find_or_create_by!(name: field_type_user_name)
    @type_user = TypeUser.find(type_user_id)
  end

  def call
    bind unless binded
  end

  private

  def bind
    @field_type_user_type_user = FieldTypeUserTypeUser.create!(
      type_user_id: @type_user.id,
      field_type_user_id: @field_type_user.id
    )
  end

  def binded
    FieldTypeUserTypeUser.exists?(type_user_id: @type_user.id,
                                  field_type_user_id: @field_type_user.id)
  end
end
