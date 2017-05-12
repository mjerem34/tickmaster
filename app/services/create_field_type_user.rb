# create_field_type_user.rb
class CreateFieldTypeUser
  # params[:all] is used for assign the field type user to all the type users
  # at the creation
  def initialize(params:)
    @all = params[:all]
    @name = params[:name]
  end

  def call
    assign_to_all_type_users if @all
    field_type_user
  end

  private

  def assign_to_all_type_users
    TypeUser.all.each do |type_user|
      FieldTypeUserTypeUser
        .find_or_create_by(type_user_id: type_user.id,
                           field_type_user_id: field_type_user.id)
    end
  end

  def field_type_user
    @field_type_user ||= FieldTypeUser.create(name: @name)
  end
end
