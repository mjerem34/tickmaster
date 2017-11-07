# password_resets_controller.rb
class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, only: %i[edit update]

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      render json: 'Un email contenant les instructions pour changer votre'\
      ' mot de passe vous a été envoyé', status: 200
    else
      render json: "L'utilisateur est introuvable", status: 422
    end
  end

  def edit; end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      puts @user.errors.full_messages.inspect
      render json: nil, status: 200
    else
      render json: 'Impossible de changer votre mot de passe', status: 422
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    return if @user
    flash[:error] = 'Votre compte est introuvable, veuillez réessayer'
    redirect_to root_url
  end
end
