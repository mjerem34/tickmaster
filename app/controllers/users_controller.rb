class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy edit download]
  before_action :set_expiration
  before_action :restrict_access, except: %i[new create forget_identifiers change_ip]
  skip_before_action :set_default_rights, only: [:new]

  # GET /users
  def index
    @edit_other_user = verify_right('edit_other_user')
    @enable_disable_user = verify_right('enable_disable_user')
    @view_users_pages = verify_right('view_users_pages')
    @users = User.order('pseudo asc')
    respond_to do |format|
      format.json { render json: @users }
      format.html { render :index }
    end
  end

  # PUT /user/:id/enable_disable
  def enable_disable
    @enable_disable_user = verify_right('enable_disable_user')
    if @enable_disable_user
      @user = User.find(params[:id])
      if @user.update(actif: params[:actif])
        respond_to { |format| format.json { head :no_content } }
      else
        respond_to { |format| format.json { render json: nil, status: 422 } }
      end
    else
      permission_denied
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
    # This appenned if the user has completed the email field.
    unless params[:email].nil?
      @user = User.find_by_email(params[:email])
      respond_to do |format|
        if @user.nil?
          format.json { render json: "L'adresse email est incorrecte, peut être n'êtes vous pas encore inscrit ?", status: 404 }
          format.html { redirect_to signup_path, notice: "L'adresse email est incorrecte, peut être n'êtes vous pas encore inscrit ?" }
        else
          begin
            AppMailer.pseudonyme_forgeted(@user).deliver_now
            format.json { render json: 'Un email contenant votre pseudonyme vient de vous être envoyé.', status: :ok }
            format.html { redirect_to signin_path, notice: 'Un email contenant votre pseudonyme vient de vous être envoyé.' }
          rescue Exception => e
            format.json { render json: "Impossible d'envoyer le mail car l'accès internet est inexistant ou votre adresse email est invalide, veuillez vous addresser à votre administrateur réseau", status: 422 }
            format.html { redirect_to signin_path, notice: "Impossible d'envoyer le mail car l'accès internet est inexistant ou votre adresse email est invalide, veuillez vous addresser à votre administrateur réseau" }
          end
        end
      end
    end
  end

  # GET /users/:id
  # GET /users/:id.json
  # Should render all the incidents that the user have created.
  # TODO: Mettre ça dans incidents avec un if peut etre ? Et dans un service object si besoin
  def show
    @incidents = Incident.where(user_id: current_user.id, incident_state_id_for_user_id: [1, 2, 3, 4, 5, 6, 8, 9, 11, 12]).includes(:user, :category, :sous_category).order('created_at desc')
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :show }
    end
  end

  # GET /users/new
  def new
    @user = User.new
    @type_users = if current_user && current_user.can?('create_new_tech')
      TypeUser.where(actif: true)
    else
      TypeUser.where(is_tech: false, actif: true)
    end
  end

  # GET /user/:id/edit
  # GET /user/:id/edit.json
  # Should render the form for edit his profile.
  def edit
    if @user.nil?
      respond_to do |format|
        format.json { render json: "Cet utilisateur n'existe pas !", status: 404 }
        format.html { redirect_to '/', notice: "Cet utilisateur n'existe pas !" }
      end
    elsif current_user == @user || verify_right('edit_other_user')
      @edit_all_user = verify_right('edit_all_user')
      @delete_user = verify_right('delete_user')
      @type_users = TypeUser.all.order('name asc')
      @agencies = Agency.all.order('name ASC')
      @field_type_users = @user.type_user.field_type_users
      respond_to do |format|
        format.json { render json: @user }
        format.html { render :edit }
      end
    else
      permission_denied
    end
  end

  # GET /users/:id/to_treat
  # GET /users/:id/to_treat.json
  # Should render all the incidents that the tech have to treat.
  # This page load only if current_user is tech.
  # TODO ; Mettre ça dans incidents
  def to_treat
    @treat_incidents = verify_right('treat_incidents')
    if @treat_incidents
      @incidents = current_user.tech_incidents.where(incident_state_id_for_tech_id: [2, 3, 4, 5, 6]).order('created_at desc')
      respond_to do |format|
        format.json { render json: @incidents }
        format.html { render :to_treat }
      end
    else
      permission_denied
    end
  end

  # GET /users/:id/all_incidents
  # GET /users/:id/all_incidents.json
  # As not his name said, it does not render all the incidents of everyone.
  # But only all the incidents of the current_user.
  # The incidents closed, rejected, and opened.
  # TODO : Mettre ça dans incidents
  def allincidents
    @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).where(incident_state_id_for_user_id: [7, 10]).order('created_at desc')
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :allincidents }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if !current_user.nil?
      if verify_right('create_new_tech')
        create_user
      else
        permission_denied
      end
    else
      if !@user.type_user.is_tech
        create_user
      else
        permission_denied
      end
    end
  end

  # PUT /users/:id
  # PUT /users/:id.json
  # Should changes the params of the user.
  def update
    @edit_other_user = verify_right('edit_other_user')
    if @edit_other_user || current_user == @user
      respond_to do |format|
        if @user.update(user_params)
          format.json { head :no_content }
          format.html { redirect_to @user, notice: 'Vos informations ont bien été actualisées.' }
        else
          format.json { render json: @user.errors, status: 422 }
          format.html { render :edit, notice: "Impossible d'éditer vos paramètres ... Pourquoi voulez vous changer ? Vous n'êtes pas assez bien comme ça ?" }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /users/:id
  # DELETE /users/:id.json
  # Should delete the user selected but nobody have the right to do that terrible thing ... Fortunately ...
  def destroy
    @delete_user = verify_right('delete_user')
    if @delete_user
      respond_to do |format|
        if @user.destroy
          format.json { head :no_content }
          format.html { redirect_to users_url, notice: "Vous venez de supprimer un utilisateur, ce n'est pas bien de prendre une vie ..." }
        else
          format.json { render json: @user.errors, status: 422 }
          format.html { render :edit, notice: 'Impossible de supprimer cet utilisateur, il est définitivement plus fort que vous !' }
        end
      end
    else
      permission_denied
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue
    @user = nil
  end

  def user_params
    params.require(:user).permit(:surname, :name, :pseudo, :email, :tel, :type_user_id, :agency_id, :password, :ip_addr)
  end

  def create_user
    respond_to do |format|
      if @user.save
        sign_in @user if current_user.nil?
        format.json { render json: @user.id, status: :created }
        User.joins(:type_user).where('type_users.is_tech=1').each do |tech|
          next if tech.ip_addr.blank?
          sendNotif(tech.ip_addr, @user.name + ' ' + @user.surname + " vient de s'inscrire !")
        end
      else
        format.json { render json: @user.errors.full_messages.first, status: 422 }
      end
    end
  end
end
