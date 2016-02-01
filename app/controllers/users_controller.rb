class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :profil, :download]
  before_action :set_expiration

  def home
    @title = 'Utilisateurs'
  end

  def index # Page liste des utilisateurs
    @users = User.all
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
    if params[:order_by].nil?
      @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).order("created_at asc")
    else
      @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).order(params[:order_by])
      respond_to do |format|
        format.js {render action: :order_by}
      end
    end
  end

  def profil
  end

  def to_treat
    if params[:order_by].nil?
      @incidents = Incident.where(tech_id: current_user.id).includes(:user, :category, :sous_category).order("created_at asc")
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
      @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).where(incident_state_id_for_user: [7, 10]).order("created_at asc")
    else
      @incidents = Incident.where(user_id: current_user.id).includes(:user, :category, :sous_category).where(incident_state_id_for_user: [7, 10]).order(params[:order_by])
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


  private

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
