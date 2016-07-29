class SessionsController < ApplicationController
  # before_action :set_expiration

  def new
    @title = "S'identifier"
  end

  def create
    user = User.authenticate(params[:session][:pseudo],
                             params[:session][:password])
    if user.nil?
      flash[:error] = 'Pseudonyme et/ou mot de passe invalide'
      @title = "S'identifier"
      render 'new'
    else
      sign_in user
      flash[:notice] = 'Connexion réussie'
      redirect_to '/'
    end
  end

  def destroy
    sign_out
    redirect_to '/'
  end

  # private
  #
  # def set_expiration
  #   expires_in(10.seconds, public: true)
  # end
end
