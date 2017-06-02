# users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy edit]
  before_action :set_expiration
  before_action :restrict_access,
                except: %i[new create change_ip]
  before_action :not_his_profile?, only: :update

  # GET /users
  def index
    @users = User.order('pseudo asc')
    respond_to do |format|
      format.json { render json: @users }
      format.html { render :index }
    end
  end

  def change_ip
    unless params[:pseudo].nil?
      @user = User.where(pseudo: params[:pseudo]).first
      if @user.nil?
        render nothing: true, status: 404, content_type: 'text/html'
        # Pseudo does not exists.
        return false
      else
        unless params[:ip_addr].nil?
          @user.update(ip_addr: params[:ip_addr])
          render json: @user
          # All it is ok ! Ip is changed.
          return true
        end
      end
      render json: @user, status: 206
      # params[:ip_addr] = nil => ERROR.
      return false
    end
    render nothing: true, status: 400, content_type: 'text/html'
    # params[:ip_addr] = nil and params[:pseudo] = nil => BIG ERROR !
    false
  end

  # GET /users/:id
  # GET /users/:id.json
  def show
    @incidents = current_user.incidents
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :show }
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @type_users = if current_user && current_user.can?('create_users')
                    TypeUser.where(actif: true)
                  else
                    TypeUser.where(is_tech: false, actif: true)
                  end
  end

  # GET /user/:id/edit
  # GET /user/:id/edit.json
  def edit
    @agencies = Agency.all.order('name ASC')
    @field_type_users = @user.type_user.field_type_users
    respond_to do |format|
      format.json { render json: @user }
      format.html { render :edit }
    end
  end

  # GET /users/:id/to_treat
  # GET /users/:id/to_treat.json
  def to_treat
    @incidents = current_user
                 .tech_incidents
                 .where(
                   incident_state_id_for_tech_id: [2, 3, 4, 5, 6]
                 )
                 .order('created_at desc')
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :to_treat }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = CreateUser.new(params: user_params, current_user: current_user).call
    render json: @user.result, status: @user.status
  end

  # PUT /users/:id
  # PUT /users/:id.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { head :no_content }
        format.html { redirect_to @user, notice: 'Profil actualisé.' }
      else
        format.json { render json: @user.errors.full_messages, status: 422 }
        format.html { render :edit, notice: "Impossible d'editer votre profil" }
      end
    end
  end

  # DELETE /users/:id
  # DELETE /users/:id.json
  def destroy
    if @user.destroy
      render json: nil
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:surname, :name, :pseudo, :email, :tel, :type_user_id, :agency_id, :password, :ip_addr)
  end

  def not_his_profile?
    return nil if current_user == @user || current_user.can?('edit_other_users')
    permission_denied
  end
end
