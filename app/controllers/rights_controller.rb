class RightsController < ApplicationController
  before_action :set_right, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access, only: [:show, :index, :edit, :new, :destroy]

  def index
    @rights = Right.all
    @right = Right.new
  end

  def show
  end

  def new
    @right = Right.new
  end

  def edit
  end

  def create
    @right = Right.new(right_params)
    respond_to do |format|
      if @right.save && !@right.name.nil? && !@right.content.nil?
        format.html { redirect_to rights_url, notice: 'Droit créé.' }
        format.json { render json: :index, status: :created, location: @right }
      else
        format.html { redirect_to new_right_path, notice: 'Veuillez entrer un nom et/ou une description du droit.' }
        format.json { render json: @right.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @right.update(right_params)
        format.html { redirect_to rights_path, notice: 'Droit mis à jour.' }
        format.json { render :show, status: :ok, location: @right }
      else
        format.html { render :edit }
        format.json { render json: @right.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @right.destroy
    respond_to do |format|
      format.html { redirect_to rights_url, notice: 'Droit supprimé.' }
      format.json { head :no_content }
    end
  end

  def self.verify_rights_for(right_name, current_user)
    return true if !current_user.nil? && Right.where(name: right_name).pluck(current_user.tech.name).join('') == 'true'
  end

  private

  def restrict_access
    if current_user.nil?
      flash[:not_authorized] = "Vous n'avez pas l'autorisation d'accéder à cette page"
      redirect_to '/'
    end
  end

  def set_expiration
    expires_in(10.seconds, public: true)
  end

  def set_right
    @right = Right.find(params[:id])
  end

  def right_params
    params.require(:right).permit(:name, :content, :user, :tech, :super_tech, :admin, :disp, :assistant, :expert, :comptable)
  end
end
