class TypeUsersController < ApplicationController
  before_action :set_type_user, only: [:update, :destroy, :disable_type_users]
  before_action :set_expiration
  before_action :restrict_access
  # GET /type_users
  # GET /type_users.json
  def index
    @view_type_users = verifRight('view_type_users')
    if @view_type_users
      @title = 'Liste des types utilisateurs'
      @type_users = TypeUser.all.order('name')
      @rights = Right.all
      @field_type_users = FieldTypeUser.all
      respond_to do |format|
        format.json { render json: @type_users }
        format.html { render :index }
      end

    else
      renderUnauthorized
    end
  end

  # POST /type_users
  # POST /type_users.json
  def create
    @add_type_users = verifRight('add_type_users')
    if @add_type_users
      @field_type_users = FieldTypeUser.all
      respond_to do |format|
        if !params[:secure].blank? && !params[:is_tech].blank? && !params[:actif].blank?
          @type_user = TypeUser.new(name: params[:type_user_name], secure: params[:secure], is_tech: params[:is_tech], actif: params[:actif])
          if @type_user.save
            params[:rights].each do |index, right|
              unless TypeUserRight.exists?(right_id: index, type_user_id: @type_user.id, value: right)
                TypeUserRight.create(right_id: index, type_user_id: @type_user.id, value: right)
              end
            end
            format.js
            format.json { render json: @type_user.id, status: :created }
          else
            format.json { render json: @type_user.errors.full_messages.first, status: :unprocessable_entity }
          end
        else
          format.json { render json: 'Merci de remplir tous les champs', status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # POST /type_user/1/add_field_type_user
  def add_field_type_user
    @edit_type_users = verifRight('edit_type_users')
    if @edit_type_users
      respond_to do |format|
        if !params[:name].blank? && !params[:id].blank?
          @type_user = TypeUser.find(params[:id])
          @field_type_user = FieldTypeUser.find_or_create_by(name: params[:name])
          if !FieldTypeUserTypeUser.exists?(type_user_id: @type_user.id, field_type_user_id: @field_type_user.id)
            @field_type_user_type_user = FieldTypeUserTypeUser.find_or_create_by(type_user_id: @type_user.id, field_type_user_id: @field_type_user.id)
            if @field_type_user_type_user.save
              format.js
              format.json { head :no_content }
            else
              format.json { render json: @field_type_user_type_user.errors.full_messages.first }
            end
          else
            format.json { render json: 'Ce champ est déjà renseigné !' }
          end
        else
          format.json { render json: 'Veuillez remplir tous les champs', status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /type_users/1/delete_field_type_user
  def delete_field_type_user
    @edit_type_users = verifRight('edit_type_users')
    if @edit_type_users
      respond_to do |format|
        if !params[:field_type_user][:id].blank? && !params[:id].blank? && !params[:force].blank?
          if params[:force] == 'true' && verifRight('force_destroy_field_type_user')
            User.where(type_user_id: params[:id]).each do |user|
              FieldUser.where(field_type_user_id: params[:field_type_user][:id], user_id: user.id).delete_all
            end
            @field_type_user_type_user = FieldTypeUserTypeUser.where(field_type_user_id: params[:field_type_user][:id], type_user_id: params[:id]).first
            if @field_type_user_type_user.destroy
              format.js
              format.json { head :no_content }
            else
              format.json { render json: @field_type_user_type_user.errors.full_messages.first, status: :unprocessable_entity }
            end
          else
            if User.where(type_user_id: params[:id]).any?
              User.where(type_user_id: params[:id]).each do |user|
                if FieldUser.where(field_type_user_id: params[:field_type_user][:id], user_id: user.id).any?
                  if params[:force] == 'true' && !verifRight('force_destroy_field_type_user')
                    format.json { render json: 'Impossible de supprimer le champ de type utilisateur car vous n\'avez pas les droits nécéssaires.', status: :unauthorized }
                  else
                    format.json { render json: 'Impossible de supprimer le champ de type utilisateur car il contient des données associées.', status: :unauthorized }
                  end
                  break
                else
                  @field_type_user_type_user = FieldTypeUserTypeUser.where(field_type_user_id: params[:field_type_user][:id], type_user_id: params[:id]).first
                  if @field_type_user_type_user.destroy
                    format.js
                    format.json { head :no_content }
                  else
                    format.json { render json: @field_type_user_type_user.errors.full_messages.first, status: :unprocessable_entity }
                  end
                  break
                end
              end
            else
              @field_type_user_type_user = FieldTypeUserTypeUser.where(field_type_user_id: params[:field_type_user][:id], type_user_id: params[:id]).first
              if @field_type_user_type_user.destroy
                format.js
                format.json { head :no_content }
              else
                format.json { render json: @field_type_user_type_user.errors.full_messages.first, status: :unprocessable_entity }
              end
            end
          end
        else
          format.json { render json: 'Veuillez remplir tous les champs', status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /type_users/1
  # PATCH/PUT /type_users/1.json
  def update
    @edit_type_users = verifRight('edit_type_users')
    if @edit_type_users
      respond_to do |format|
        if @type_user.update(type_user_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @type_user.errors.full_messages.first, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /type_users/1/disable_type_users.json
  def disable_type_users
    @disable_type_users = verifRight('disable_type_users')
    if @disable_type_users
      respond_to do |format|
        if @type_user.update(actif: !@type_user.actif)
          @type_user.users.each { |user| !@type_user.actif ? user.update(actif: false) : user.update(actif: true) }
          format.json { head :no_content }
        else
          format.json { render json: @type_user.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /type_users/1.json
  def destroy
    @destroy_type_users = verifRight('destroy_type_users')
    if @destroy_type_users
      respond_to do |format|
        if @type_user.users.any?
          format.json { render json: 'Vous ne pouvez pas supprimer ce type utilisateur car il contient des utilisateurs', status: :unprocessable_entity }
        else
          if @type_user.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @type_user.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_type_user
    @type_user = TypeUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def type_user_params
    params.require(:type_user).permit(:name, :secure, :is_tech, :actif)
  end
end
