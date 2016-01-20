class SessionsController < ApplicationController
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

  def forget_identifiers
    @title = 'Pseudonyme oublié'
    if User.find_by_email(params[:email])
      redirect_to :back
    else
      redirect_to '/pages/home'
    end
  end

  def recover_pseudonyme
    if user
      redirect_to :back
    else
      redirect_to '/'
    end
  end
end
