class FieldTypeUsersController < ApplicationController
  before_action :set_field_type_user, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /field_type_users
  # GET /field_type_users.json
  def index
    @view_field_type_users = verifRight('view_field_type_users')
    if @view_field_type_users
      @title = 'Champs utilisateurs'
      @field_type_users = FieldTypeUser.all
      respond_to do |format|
        format.json { render json: @field_type_users }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /field_type_users.json
  def create
    @add_field_type_users = verifRight('add_field_type_users')
    if @add_field_type_users
      @title = "Création d'un champ type utilisateur"
      @field_type_user = FieldTypeUser.new(field_type_user_params)
      respond_to do |format|
        if @field_type_user.save
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
      renderUnauthorized
    end
  end

  # PATCH/PUT /field_type_users/1.json
  def update
    @edit_fields_type_user = verifRight('edit_fields_type_user')
    if @edit_fields_type_user
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
      renderUnauthorized
    end
  end

  # DELETE /field_type_users/1.json
  def destroy
    @delete_field_type_user = verifRight('delete_field_type_user')
    if @delete_field_type_user
      @title = "Suppression d'un champ type utilisateur"
      respond_to do |format|
        if !@field_type_user.field_type_user_type_users.any?
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
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_field_type_user
    @field_type_user = FieldTypeUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def field_type_user_params
    params.require(:field_type_user).permit(:name)
  end
end
