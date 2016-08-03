class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /categories
  # GET /categories.json
  def index
    @view_index_categories = verifRight('view_index_categories')
    if @view_index_categories
      @view_details_category = verifRight('view_details_category')
      @delete_category = verifRight('delete_category')
      @categories = Category.all
      @category = Category.new
      @title = "Catégories"
      respond_to do |format|
        format.json { render json: @categories }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    if verifRight('view_details_category')
      @title = "Catégorie : " + @category.name
      respond_to do |format|
        format.json { render json: @category }
        format.html { redirect_to :edit_category }
      end
    else
      renderUnauthorized
    end
  end

  # GET /categories/new
  def new
    @create_new_category = verifRight('create_new_category')
    if @create_new_category
      @title = "Nouvelle catégorie"
      @category = Category.new
    else
      renderUnauthorized
    end
  end

  # GET /categories/1/edit
  def edit
    @edit_category = verifRight('edit_category')
    if @edit_category
      @title = "Editer catégorie : #{@category.name}"
      @sous_category = SousCategory.new
    else
      renderUnauthorized
  end
  end

  def create_cats
    if verifRight('create_new_category')
      @title = "Nouvelle catégorie"
      @category = Category.new(name: params[:category_name])
      respond_to do |format|
        if @category.save
          format.js
          @sous_category = SousCategory.new(name: 'Autre', category_id: @category.id, lvl_urgence_max: '10')
          @sous_category.save
        end
      end
    else
      renderUnauthorized
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    if verifRight('create_new_category')
      @title = "Nouvelle catégorie"
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.json { render json: @category, status: :created }
          format.html { redirect_to :back, notice: 'Catégorie crée avec success.' }
          @sous_category = SousCategory.new(name: 'Autre', category_id: @category.id, lvl_urgence_max: '10')
          @sous_category.save
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
          format.html { redirect_to :back, notice: "Impossible de créer la catégorie ..." }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if verifRight('edit_category')
      respond_to do |format|
        if @category.update(category_params)
          format.json { render json: @category, status: :ok }
          format.html { redirect_to :back, notice: "Catégorie actualisée avec success." }
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
          format.html { render :back, notice: "Impossible de modifier la catégorie ..." }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if verifRight('delete_category')
      if Incident.where(category_id: @category.id).pluck(:title).join('') == ''
        @category.destroy!
        respond_to do |format|
          format.json { head :no_content }
          format.html { redirect_to categories_url, notice: "Catégorie supprimée" }
        end
      else
        respond_to do |format|
          format.json { render json: "Impossible de supprimer la catégorie car elle contient des incidents !", status: 409 }
          format.html { redirect_to categories_url, notice: "Vous ne pouvez pas supprimer cette catégorie car elle contient des incidents !" }
        end
      end

    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
