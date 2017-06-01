# sessions_controller.rb
class SessionsController < ApplicationController
  before_action :set_user, only: :create
  before_action :already_connected, only: :create

  # GET /sessions/new
  def new
    if !current_user.nil?
      redirect_to root_path
    else
      render :new
    end
  end

  # POST /sessions
  # POST /sessions.json
  def create
    respond_to do |format|
      if @user.nil?
        format.json { render json: 'Identifiants invalides', status: 404 }
        format.html { redirect_to '/sessions', alert: 'Identifiants invalides' }
      else
        user_is_active?(format)
      end
    end
  end

  # DELETE /sessions
  def destroy
    respond_to do |format|
      if current_user.nil?
        format.json { render json: 'Déjà déconnecté !', status: 422 }
        format.html { redirect_to root_path, notice: 'Déjà déconnecté !' }
      else
        sign_out
        format.json { render json: 'Déconnexion réussie', status: :ok }
        format.html { redirect_to root_path, notice: 'Déconnexion réussie' }
      end
    end
  end

  # POST /retrieve_credentials
  def retrieve_credentials
    @user = User.find_by_email(params[:email])
    if @user.nil?
      render json: 'Email inconnu', status: 404
    else
      AppMailer.pseudonyme_forgeted(@user).deliver_now
      render json: 'Pseudonyme envoyé', status: 200
    end
  end

  private

  def set_user
    @user = User.authenticate(params[:session][:pseudo],
                              params[:session][:password])
  end

  def already_connected
    return if current_user.nil?
    respond_to do |format|
      format.json { render json: 'Vous êtes déjà connecté !', status: 202 }
      format.html { redirect_to '/', notice: 'Vous êtes déjà connecté !' }
    end
  end

  def user_is_active?(format)
    if @user.actif == false || @user.type_user.actif == false
      format.json { render json: 'Compte désactivé', status: 403 }
      format.html { redirect_to '/sessions', notice: 'Compte désactivé' }
    else
      sign_in @user
      format.json { render json: 'Connexion réussie' }
      format.html { redirect_to root_path, notice: 'Connexion réussie' }
    end
  end
end
