# user_sessions_controller.rb
class UserSessionsController < ApplicationController
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
end
