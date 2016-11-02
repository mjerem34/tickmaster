class FieldTypeUsersController < ApplicationController
  before_action :set_field_type_user, only: [:show, :edit, :update, :destroy]

  # GET /field_type_users
  # GET /field_type_users.json
  def index
    @field_type_users = FieldTypeUser.all
  end

  # GET /field_type_users/1
  # GET /field_type_users/1.json
  def show
  end

  # GET /field_type_users/new
  def new
    @field_type_user = FieldTypeUser.new
  end

  # GET /field_type_users/1/edit
  def edit
  end

  # POST /field_type_users
  # POST /field_type_users.json
  def create
    if verifRight('add_field_type_users')
      respond_to do |format|
        if @field_type_user.save
          format.json { render :show, status: :created, location: @field_type_user }
        else
          format.json { render json: @field_type_user.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /field_type_users/1
  # PATCH/PUT /field_type_users/1.json
  def update
    respond_to do |format|
      if @field_type_user.update(field_type_user_params)
        format.html { redirect_to @field_type_user, notice: 'Field type user was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_type_user }
      else
        format.html { render :edit }
        format.json { render json: @field_type_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_type_users/1
  # DELETE /field_type_users/1.json
  def destroy
    @field_type_user.destroy
    respond_to do |format|
      format.html { redirect_to field_type_users_url, notice: 'Field type user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_field_type_user
    @field_type_user = FieldTypeUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_type_user_params
    params.require(:field_type_user).permit(:type_user_id, :name)
  end
end
