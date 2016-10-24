class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :profil, :download]
  before_action :set_expiration
  before_action :restrict_access, except: [:new_user, :create, :forget_identifiers, :change_ip]
  skip_before_action :set_default_rights, only: [:new_user]
  # GET /users
  # GET /users.json
  # Should render all users.
  def index
    @view_index_users = verifRight('view_index_users')
    if @view_index_users
      @title = 'Liste des utilisateurs'
      @edit_other_user = verifRight('edit_other_user')
      @enable_disable_user = verifRight('enable_disable_user')
      @view_users_pages = verifRight('view_users_pages')
      @users = User.order('pseudo asc')
      respond_to do |format|
        format.json { render json: @users }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # PUT /user/:id/enable_disable
  def enable_disable
    @enable_disable_user = verifRight('enable_disable_user')
    if @enable_disable_user
      @title = 'Activer/Désactiver un utilisateur'
      @user = User.find(params[:id])
      if @user.update(actif: params[:actif])
        respond_to { |format| format.json { head :no_content } }
      else
        respond_to { |format| format.json { render json: nil, status: :unprocessable_entity } }
      end
    else
      renderUnauthorized
    end
  end

  # Should be used for the desktop application.
  # It gets the ip address of the user that start the desktop app, and
  # it update his params.
  # It used for the notifications desktop app.
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
          render json: @user, status: 200
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

  # GET /users/forget_identifiers
  # POST /users/forget_identifiers
  # Render the page for those that forget his email (noobs).
  # And on reload (when user has completed field) it send an email.
  def forget_identifiers
    @title = 'Identifiants oubliés'
    @user = User.find_by_email(params[:email])
    # This appenned if the user has completed the email field.
    unless params[:email].nil?
      if !@user.nil?
        begin
          respond_to do |format|
            AppMailer.pseudonyme_forgeted(@user).deliver_now
            format.json { render json: 'Un email contenant votre pseudonyme vient de vous être envoyé.', status: :ok }
            format.html { redirect_to signin_path, notice: 'Un email contenant votre pseudonyme vient de vous être envoyé.' }
          end
        rescue
          nil
        end
      else
        respond_to do |format|
          format.json { render json: "L'adresse email est incorrecte, peut être n'êtes vous pas encore inscrit ?", status: :unprocessable_entity }
          format.html { redirect_to signup_path, notice: "L'adresse email est incorrecte, peut être n'êtes vous pas encore inscrit ?" }
        end
      end
    end
  end

  # GET /users/:id
  # GET /users/:id.json
  # Should render all the incidents that the user have created.
  def show
    @incidents = Incident.where(user_id: current_user.id, incident_state_id_for_user_id: [1, 2, 3, 4, 5, 6, 8, 9, 11, 12]).includes(:user, :category, :sous_category).order('created_at desc')
    @title = 'Mes incidents'
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :show }
    end
  end

  # GET /users/new_tech
  def new_tech
    @create_new_tech = verifRight('create_new_tech')
    if @create_new_tech
      @user = User.new
      @title = 'Créer un utilisateur'
      @type_users = TypeUser.where(actif: true)
    else
      renderUnauthorized
    end
  end

  # GET /users/new_user
  def new_user
    @user = User.new
    @type_users = TypeUser.where(is_tech: false, actif: true)
  end

  # GET /user/:id/profil
  # GET /user/:id/profil.json
  # Should render the form for edit his profile.
  # TODO: Maybe re-use the edit mthd for that ...
  def profil
    if @user.nil?
      respond_to do |format|
        format.json { render json: "Cet utilisateur n'existe pas !", status: 404 }
        format.html { redirect_to '/', notice: "Cet utilisateur n'existe pas !" }
      end
      return false
    end
    if current_user == @user || verifRight('edit_other_user')
      @title = "Profil d'utilisateur #{@user.surname} #{@user.name}"
      @edit_like_a_boss = verifRight('edit_like_a_boss')
      @type_users = TypeUser.all.order('name asc')
      @agencies = Agency.all.order('name ASC')
      respond_to do |format|
        format.json { render json: @user }
        format.html { render :profil }
      end
    else
      renderUnauthorized
    end
  end

  # GET /users/:id/to_treat
  # GET /users/:id/to_treat.json
  # Should render all the incidents that the tech have to treat.
  # This page load only if current_user is tech.
  def to_treat
    @treat_incidents = verifRight('treat_incidents')
    if @treat_incidents
      @title = 'Incidents à traiter'
      @incidents = current_user.tech_incidents.where(incident_state_id_for_tech_id: [2, 3, 4, 5, 6]).order('created_at desc')
      respond_to do |format|
        format.json { render json: @incidents }
        format.html { render :to_treat }
      end
    else
      renderUnauthorized
    end
  end

  # GET /users/:id/all_incidents
  # GET /users/:id/all_incidents.json
  # As not his name said, it does not render all the incidents of everyone.
  # But only all the incidents of the current_user.
  # The incidents closed, rejected, and opened.
  def allincidents
    @title = "Liste des incidents cloturés de #{current_user.surname} #{current_user.name}"
    @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).where(incident_state_id_for_user_id: [7, 10]).order('created_at desc')
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :allincidents }
    end
  end

  # POST /users
  # POST /users.json
  # Should be used for create an user.
  # It signin the user when created.
  def create
    @user = User.new(user_params)
    @user.password = '' unless @user.type_user.secure
    respond_to do |format|
      if User.exists?(pseudo: @user.pseudo)
        format.json { render json: "Nom d'utilisateur déjà enregistré", status: 409 }
        format.html do
          flash[:notice] = "Nom d'utilisateur déjà enregistré"
          if current_user.nil?
            redirect_to :back
          else
            redirect_to :back
          end
        end
      else
        if @user.save
          # If it is new user and if there are no user currently signed in
          # It signed in automatically.
          if current_user.nil?
            sign_in @user
            format.json { render json: @user.id, status: :created }
            format.html { redirect_to pages_help_path, notice: 'Bienvenue, votre inscription a bien été prise en compte.' }
            User.joins(:type_user).where('type_users.is_tech=1').each do |tech|
              next if tech.ip_addr.blank?
              sendNotif(tech.ip_addr, @user.name + ' ' + @user.surname + " vient de s'inscrire !")
            end
          else
            # It render only the id in json.
            format.json { render json: @user.id, status: :created }
            format.html { redirect_to :back, notice: "L'utilisateur a bien été créé." }
          end
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.html { redirect_to :back, notice: "Impossible  de procéder à l'inscription, veuillez contacter votre administrateur réseau." }
        end
      end
    end
  end

  # PUT /users/:id
  # PUT /users/:id.json
  # Should changes the params of the user.
  def update
    @edit_other_user = verifRight('edit_other_user')
    if @edit_other_user || current_user == @user
      respond_to do |format|
        if @user.update(user_params)
          format.json { head :no_content }
          format.html { redirect_to @user, notice: 'Vos informations ont bien été actualisées.' }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: "Impossible d'éditer vos paramètres ... Pourquoi voulez vous changer ? Vous n'êtes pas assez bien comme ça ?" }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /users/:id
  # DELETE /users/:id.json
  # Should delete the user selected but nobody have the right to do that terrible thing ... Fortunately ...
  def destroy
    @delete_user = verifRight('delete_user')
    if @delete_user
      respond_to do |format|
        if @user.destroy
          format.json { head :no_content }
          format.html { redirect_to users_url, notice: "Vous venez de supprimer un utilisateur, ce n'est pas bien de prendre une vie ..." }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de supprimer cet utilisateur, il est définitivement plus fort que vous !' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue
    @user = nil
  end

  def user_params
    params.require(:user).permit(:type_user_id, :pseudo, :password, :email, :tel, :salt, :agency_id, :mode, :ip_addr, :sys_msg, :actif, :name, :surname, file_users_attributes: [:id, :user_id, :file, :content_type, :file_size])
  end
end
