class SessionsController < ApplicationController
  # before_action :set_expiration

  def new
    @title = "S'identifier"
  end

  # POST /sessions
  # POST /sessions.json
  def create
    respond_to do |format|
      if !current_user.nil?
        format.json { render json: 'Vous êtes déjà connecté !' }
        format.html { redirect_to '/', notice: 'Vous êtes déjà connecté !' }
      else
        user = User.authenticate(params[:session][:pseudo],
                                 params[:session][:password])
        if user.nil?
          @title = "S'identifier"
          format.json { render json: 'Pseudonyme et/ou mot de passe invalide' }
          format.html { render :new, notice: 'Pseudonyme et/ou mot de passe invalide' }
        else
          sign_in user
          if current_user.maj == true || current_user.maj.nil?
            @changesMade = Update.last
            format.json { render json: @changesMade.changesMade, status: 202 }
            format.html { redirect_to '/' }
          else
            format.json { render json: 'Connexion réussie', status: :ok }
            format.html { redirect_to '/', notice: 'Connexion réussie' }
          end
        end
      end
    end
  end

  # DELETE /sessions
  def destroy
    respond_to do |format|
      if current_user.nil?
        format.json { render json: 'Vous êtes déjà déconnecté !' }
        format.html { redirect_to '/', notice: 'Vous êtes déjà déconnecté !' }
      else
        sign_out
        format.json { render json: 'Déconnexion réussie', status: :ok }
        format.html { redirect_to '/', notice: 'Déconnexion réussie' }

      end
    end
  end
end
