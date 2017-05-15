# field_type_users_controller.rb
class FieldTypeUsersController < ApplicationController
  before_action :set_field_type_user,
                only: %i[update destroy unbind]
  before_action :set_expiration
  before_action :restrict_access
  before_action -> { type_user_binded?(params[:force]) },
                only: %i[destroy unbind]
  # GET /field_type_users
  # GET /field_type_users.json
  def index
    @field_type_users = FieldTypeUser.all
    respond_to do |format|
      format.json { render json: @field_type_users }
      format.html { render :index }
    end
  end

  # POST /field_type_users.json
  def create
    @field_type_user = CreateFieldTypeUser.new(params: field_type_user_params)
                                          .call
    respond_to do |format|
      if @field_type_user.persisted?
        format.js
        format.json { render json: @field_type_user.id, status: :created }
      else
        format.json { render json: @field_type_user.errors, status: 422 }
      end
    end
  end

  # PATCH/PUT /field_type_users/1.json
  def update
    respond_to do |format|
      if @field_type_user.update(field_type_user_params)
        format.js
        format.json { head :no_content }
      else
        format.json { render json: @field_type_user.errors, status: 422 }
      end
    end
  end

  # DELETE /field_type_users/1.json
  def destroy
    respond_to do |format|
      if @field_type_user.destroy
        format.js
        format.json { head :no_content }
      else
        format.json { render json: @field_type_user.errors, status: 422 }
      end
    end
  end

  # DELETE /field_type_users/1/unbind.json
  def unbind
    respond_to do |format|
      if UnbindFieldTypeUser.new(params: field_type_user_params,
                                 id: params[:id]).call
        format.js
        format.json { head :no_content }
      else
        format.json { render json: 'Impossible de délier', status: 422 }
      end
    end
  end

  private

  def type_user_binded?(force)
    # If binded to an type_user and force = false
    # (we dont force the destroy/unbind)
    # we verify if an user have already filled this field => user_binded?
    # if the destroy is forced(force = true), we destroy all in dependent
    user_binded? if @field_type_user
                    .field_type_user_type_users
                    .exists? && !to_b(force)
  end

  def user_binded?
    render json: 'Un utilisateur est lié', status: 422 if @field_type_user
                                                          .field_users
                                                          .exists?
  end

  def set_field_type_user
    @field_type_user = FieldTypeUser.find(params[:id])
  end

  def field_type_user_params
    params.require(:field_type_user).permit(:name, :all, :type_user_id)
  end
end
