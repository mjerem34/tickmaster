class TypeUsersController < ApplicationController
  before_action :set_type_user, only: [:show, :edit, :update, :destroy, :disable_type_users]
  before_action :set_expiration
  before_action :restrict_access
  # GET /type_users
  # GET /type_users.json
  def index
    @view_type_users = verifRight('view_type_users')
    if @view_type_users
      @title = 'Liste des types utilisateurs'
      @type_users = TypeUser.all
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

  # GET /type_users/1
  # GET /type_users/1.json
  def show
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # GET /type_users/new
  def new
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # GET /type_users/1/edit
  def edit
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
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
        if @type_user.destroy
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
