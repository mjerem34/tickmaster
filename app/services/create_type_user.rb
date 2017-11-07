# create_type_user.rb
class CreateTypeUser
  def initialize(params, rights)
    @name = params[:name]
    @secure = params[:secure]
    @is_tech = params[:is_tech]
    @actif = params[:actif]
    @rights = rights
  end

  def call
    attempt_to_bind_rights
    @type_user
  end

  private

  def attempt_to_bind_rights
    ActiveRecord::Base.transaction do
      create_type_user
      bind_rights
    end
  end

  def create_type_user
    @type_user ||= TypeUser.create!(
      name: @name,
      secure: @secure,
      is_tech: @is_tech,
      actif: @actif
    )
  end

  def bind_rights
    @rights.each do |id, value|
      TypeUserRight.find_or_create_by!(
        right_id: id,
        type_user_id: @type_user.id,
        value: value
      )
    end
  end
end
