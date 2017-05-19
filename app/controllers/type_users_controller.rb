# type_users_controller.rb
class TypeUsersController < ApplicationController
  before_action :set_type_user,
                only: %i[update destroy disable toggle bind show]
  before_action :set_expiration
  before_action :restrict_access
  before_action :not_blank?, only: :toggle
  before_action :any_users?, only: :destroy
  # GET /type_users
  # GET /type_users.json
  def index
    @type_users = TypeUser.all.order('name')
    @field_type_users = FieldTypeUser.all
    respond_to do |format|
      format.json { render json: @type_users }
      format.html { render :index }
    end
  end

  # GET /type_users/1
  # GET /type_users/1.json
  def show
    respond_to do |format|
      format.json { render json: @type_user.rights }
      format.html { render :show }
    end
  end

  # POST /type_users
  # POST /type_users.json
  def create
    respond_to do |format|
      @type_user = CreateTypeUser.new(type_user_params, params[:rights]).call
      if @type_user.persisted?
        format.js
        format.json { render json: @type_user.id, status: :created }
      else
        format.json { render json: @type_user.errors.full_messages, status: 422 }
      end
    end
  end

  # PATCH/PUT /type_users/1
  # PATCH/PUT /type_users/1.json
  def update
    respond_to do |format|
      if @type_user.update(type_user_params)
        format.js
        format.json { head :no_content }
      else
        format.json { render json: @type_user.errors.full_messages, status: 422 }
      end
    end
  end

  # DELETE /type_users/1.json
  def destroy
    respond_to do |format|
      if @type_user.destroy
        format.js
        format.json { head :no_content }
      else
        format.json { render json: @type_user.errors.full_messages, status: 422 }
      end
    end
  end

  # PATCH /type_user/1/toggle.json
  def toggle
    if @type_user.toggle(params[:right_id], params[:checked])
      head :no_content
    else
      render json: nil, status: 422
    end
  end

  private

  def set_type_user
    @type_user = TypeUser.find(params[:id])
  end

  def type_user_params
    params.require(:type_user).permit(
      :name, :secure, :is_tech, :actif
    )
  end

  def not_blank?
    render json: nil, status: 422 if params[:checked].blank? &&
                                     params[:right].blank?
  end

  def any_users?
    render json: 'Des utilisateurs sont liés', status: 422 if @type_user
                                                              .users.any?
  end
end
