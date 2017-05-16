class SessionsController < ApplicationController
  # GET /sessions/new
  def new
    if !current_user.nil?
      @title = 'Vous êtes déjà connecté !'
      redirect_to root_path
    else
      @title = "S'identifier"
      render :new
    end
  end

  # POST /sessions
  # POST /sessions.json
  def create
    respond_to do |format|
      if !current_user.nil?
        format.json { render json: 'Vous êtes déjà connecté !', status: 202 }
        format.html { redirect_to '/', notice: 'Vous êtes déjà connecté !' }
      else
        @user = User.authenticate(params[:session][:pseudo],            params[:session][:password])
        if @user.nil?
          @title = "S'identifier"
          format.json { render json: 'Pseudonyme et/ou mot de passe invalide', status: 404 }
          format.html { redirect_to '/sessions', alert: 'Pseudonyme et/ou mot de passe invalide' }
        else
          if @user.actif == false || @user.type_user.actif == false
            @title = "S'identifier"
            format.json { render json: 'Votre compte a été désactivé, veuillez contacter votre administrateur réseau.', status: 403 }
            format.html { redirect_to '/sessions', notice: 'Votre compte a été désactivé, veuillez contacter votre administrateur réseau.' }
          else
            sign_in @user
            puts "current_user in session : #{current_user.inspect}"
            format.json { render json: 'Connexion réussie' }
            format.html { redirect_to root_path, notice: 'Connexion réussie' }
          end
        end
      end
    end
  end

  # DELETE /sessions
  def destroy
    respond_to do |format|
      if current_user.nil?
        format.json { render json: 'Vous êtes déjà déconnecté !', status: 422 }
        format.html { redirect_to root_path, notice: 'Vous êtes déjà déconnecté !' }
      else
        sign_out
        format.json { render json: 'Déconnexion réussie', status: :ok }
        format.html { redirect_to root_path, notice: 'Déconnexion réussie' }
      end
    end
  end
end
