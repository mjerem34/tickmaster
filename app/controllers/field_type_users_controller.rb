class FieldTypeUsersController < ApplicationController
  before_action :set_field_type_user, only: %i[update destroy]
  before_action :set_expiration
  before_action :restrict_access
# TODO : Mettre ici "force_destroy_field_type_users"
  # GET /field_type_users
  # GET /field_type_users.json
  def index
    @index_field_type_users = verify_right('index_field_type_users')
    if @index_field_type_users
      @title = 'Champs utilisateurs'
      @field_type_users = FieldTypeUser.all
      respond_to do |format|
        format.json { render json: @field_type_users }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # POST /field_type_users.json
  def create
    @create_field_type_users = verify_right('create_field_type_users')
    if @create_field_type_users
      @title = "Création d'un champ type utilisateur"
      @field_type_user = FieldTypeUser.new(field_type_user_params)
      respond_to do |format|
        if @field_type_user.save
          if params[:field_type_user][:all] == 'true'
            TypeUser.all.each do |type_user|
              FieldTypeUserTypeUser.find_or_create_by(type_user_id: type_user.id, field_type_user_id: @field_type_user.id)
            end
          end
          format.js
          format.json do
            render json: @field_type_user.id,
                   status: :created
          end
        else
          format.json do
            render json: @field_type_user.errors.full_messages.first,
                   status: :unprocessable_entity
          end
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /field_type_users/1.json
  def update
    @update_field_type_users = verify_right('update_field_type_users')
    if @update_field_type_users
      @title = "Edition d'un champ type utilisateur"
      respond_to do |format|
        if @field_type_user.update(field_type_user_params)
          format.js
          format.json { head :no_content }
        else
          format.json do
            render json: @field_type_user.errors.full_messages.first,
                   status: :unprocessable_entity
          end
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /field_type_users/1.json
  def destroy
    @destroy_field_type_users = verify_right('destroy_field_type_users')
    if @destroy_field_type_users
      @title = "Suppression d'un champ type utilisateur"
      respond_to do |format|
        if @field_type_user.field_type_user_type_users.none?
          if @field_type_user.destroy
            format.js
            format.json do
              head :no_content
            end
          else
            format.json do
              render json: @field_type_user.errors.full_messages.first,
                     status: :unprocessable_entity
            end
          end
        else
          format.json do
            render json: 'Impossible de supprimer le champ car il contient'\
            ' des données associées',
                   status: :unprocessable_entity
          end
        end
      end
    else
      permission_denied
    end
  end

  def unassigns
    # TODO : Integrate !
  end

  def force_destroy
    # TODO : Integrate !
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_field_type_user
    @field_type_user = FieldTypeUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def field_type_user_params
    params.require(:field_type_user).permit(:name, :all)
  end
end
