class TypeUsersController < ApplicationController
  before_action :set_type_user, only: [:show, :edit, :update, :destroy]

  # GET /type_users
  # GET /type_users.json
  def index
    @view_type_users = verifRight('view_type_users')
    if @view_type_users
      @title = 'Liste des types utilisateurs'
      @type_users = TypeUser.all
      @rights = Right.all
    else
      renderUnauthorized
    end
  end

  # GET /type_users/1
  # GET /type_users/1.json
  def show
  end

  # GET /type_users/new
  def new
    @type_user = TypeUser.new
  end

  # GET /type_users/1/edit
  def edit
  end

  # POST /type_users
  # POST /type_users.json
  def create
    @add_type_users = verifRight('add_type_users')
    if @add_type_users
      @type_user = TypeUser.new(name: params[:type_user_name], secure: params[:secure], is_tech: params[:is_tech], actif: params[:actif])
      if @type_user.save
        params[:rights].each do |index, right|
          unless TypeUserRight.exists?(right_id: index, type_user_id: @type_user.id, value: right)
            TypeUserRight.create(right_id: index, type_user_id: @type_user.id, value: right)
          end
        end
        respond_to { |format| format.json { render json: @type_user.id, status: :created } }
      else
        respond_to { |format| format.json { render json: @type_user.errors, status: :unprocessable_entity } }
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
          format.json { head :no_content }
        else
          format.json { render json: @type_user.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /type_users/1
  # DELETE /type_users/1.json
  def destroy
    @type_user.destroy
    respond_to do |format|
      format.html { redirect_to type_users_url, notice: 'Type user was successfully destroyed.' }
      format.json { head :no_content }
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
