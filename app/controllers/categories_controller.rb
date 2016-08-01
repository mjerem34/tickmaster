class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access, only: [:show, :index, :edit, :new, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    if verifRight('edit_agency')
      @categories = Category.all
      @category = Category.new

    else
      @title = "Accès non autorisé"
      respond_to do |format|
        format.json { render json: "Vous n'avez pas l'autorisation d'accéder à cette page", status: 403 }
        format.html { redirect_to '/', not_authorized: "Vous n'avez pas l'autorisation d'accéder à cette page" }
      end
  end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    if verifRight('edit_agency')

    else
      @title = "Accès non autorisé"
      respond_to do |format|
        format.json { render json: "Vous n'avez pas l'autorisation d'accéder à cette page", status: 403 }
        format.html { redirect_to '/', not_authorized: "Vous n'avez pas l'autorisation d'accéder à cette page" }
      end
  end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @sous_category = SousCategory.new
  end

  def create_cats
    @category = Category.new(name: params[:category_name])
    respond_to do |format|
      if @category.save
        format.js
        @sous_category = SousCategory.new(name: 'Autre', category_id: @category.id, lvl_urgence_max: '10')
        @sous_category.save
      end
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to :back, notice: 'Catégorie crée avec success.' }
        format.json { render json: :show, status: :created, location: @category }
        @sous_category = SousCategory.new(name: 'Autre', category_id: @category.id, lvl_urgence_max: '10')
        @sous_category.save
      else
        format.html { redirect_to :back }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to :back, notice: "Catégorie actualisée avec success." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if Incident.where(category_id: @category.id).pluck(:title).join('') == ''
      @category.destroy!
      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Catégorie supprimée" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Vous ne pouvez pas supprimer cette catégorie car elle contient des incidents !" }
        format.json { head :no_content }
      end
    end
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

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
