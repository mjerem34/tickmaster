# user_sessions_controller.rb
class UserSessionsController < ApplicationController
  before_action :user_disabled?, only: :create
  before_action :type_user_disabled?, only: :create
  def new
    current_user.nil? ? @user_session = UserSession.new : redirect_to(current_user)
  end

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:notice] = 'Bienvenue !'
    else
      flash[:alert] = 'Identifiants invalides'
    end
    redirect_to root_path
  end

  def destroy
    current_user_session.destroy
    flash[:success] = 'Â bientôt !'
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end

  def user_disabled?
    return if User.find_by(email: params[:user_session][:email]).actif
    flash[:alert] = 'Votre compte a été désactivé'
    redirect_to root_path
  end

  def type_user_disabled?
    return if User.find_by(email: params[:user_session][:email]).type_user.actif
    flash[:alert] = "Votre type d'utilisateur a été désactivé,"\
    ' veuillez contacter votre administrateur réseau'
    redirect_to root_path
  end
end
