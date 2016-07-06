class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :profil, :download]
  before_action :set_expiration
  # before_action :restrict_access, only: [:show, :index, :profil, :to_treat, :edit, :allincidents]

  def home
    @title = 'Utilisateurs'
  end

  def index # Page liste des utilisateurs
    @users = User.order("name asc")
  end

  def forget_identifiers # Fonction pour oubli de pseudonyme
    @title = "Identifiants oubliés"
    @user = User.find_by_email(params[:email])
    unless @user.nil?
      AppMailer.pseudonyme_forgeted(@user).deliver_now
      flash[:notice] = "Un email contenant votre pseudonyme vient de vous être envoyé."
      redirect_to signin_path
    end
  end

  def show
    @incidents = Incident.where(user_id: current_user.id, incident_state_id_for_user_id: [1, 2, 3, 4, 5, 6, 8, 9, 11, 12]).includes(:user, :category, :sous_category).order("created_at asc")
    unless params[:order_by].nil?
      @incidents = @incidents.reorder(params[:order_by])
      respond_to do |format|
        format.js {render action: :order_by}
      end
    end
  end

  def profil
  end

  def to_treat
    if params[:order_by].nil?
      @incidents = current_user.tech_incidents.where(incident_state_id_for_tech: [2, 3]).order("created_at asc")
    else
      @incidents = Incident.where(tech_id: current_user.id).includes(:user, :category, :sous_category).order(params[:order_by])
      respond_to do |format|
        format.js {render action: :order_by}
      end
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def allincidents
    if params[:order_by].nil?
      @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).where(incident_state_id_for_user_id: [7, 10]).order("created_at asc")
    else
      @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).where(incident_state_id_for_user_id: [7, 10]).order(params[:order_by])
      respond_to do |format|
        format.js {render action: :order_by}
      end
    end
  end

  def create
    @user = User.new(user_params)
    if User.exists?(pseudo: @user.pseudo)
      flash[:notice] = 'Utilisateur déjà enregistré.'
      redirect_to_back
    else
      respond_to do |format|
        if @user.save
          if current_user.nil?
            sign_in @user
          else
            format.html { redirect_to current_user }
          end
          format.html do
            redirect_to pages_help_path,
                        notice: 'Bienvenue, votre inscription a bien été prise en compte.'
          end
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "Vos informations ont bien été actualisées." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_url, notice: "Vous venez de supprimer un utilisateur, ce n'est pas bien de prendre une vie ..." }
        format.json { head :no_content }
      else
        format.html { redirect_to :back }
    end
    end
  end

  def mode_nuit_jour
    current_user.update(mode: "Jour") if current_user.mode == ""
    current_user.mode == "Jour" ? current_user.update(mode: "Nuit") : current_user.update(mode: "Jour")
    redirect_to :back
  end

  private
  # def restrict_access
  #   if current_user.nil?
  #     flash[:not_authorized] = "Vous n'avez pas l'autorisation d'accéder à cette page"
  #     redirect_to '/'
  #   end
  # end

  def set_expiration
    expires_in(10.seconds, public: true)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:pseudo, :password, :email, :name, :surname,
                                 :tel, :mobile, :tech_id, :agency_id, file_users_attributes: [:id, :user_id, :file, :content_type, :file_size])
  end
end
