class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /categories
  # GET /categories.json
  # Should get and return all the categories.
  # If html, it render the index page.
  # If rest, it render json with all categories details.
  def index
    @index_categories = verify_right('index_categories')
    if @index_categories
      @show_categories = verify_right('show_categories')
      @destroy_categories = verify_right('destroy_categories')
      @categories = Category.all
      @category = Category.new
      @title = 'Catégories'
      respond_to do |format|
        format.json { render json: @categories }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  # Should render one category.
  # If html, it render the edit category page, where there are the subcategories
  # listed by name.
  def show
    if verify_right('show_categories')
      @title = 'Catégorie : ' + @category.name
      respond_to do |format|
        format.json { render json: @category }
        format.html { redirect_to :edit_category }
      end
    else
      permission_denied
    end
  end

  # GET /categories/1/edit
  # Should render the edit form for edit an category, only for web.
  def edit
    @edit_categories = verify_right('edit_categories')
    if @edit_categories
      @title = "Editer catégorie : #{@category.name}"
      @show_sous_categories = verify_right('show_sous_categories')
      @edit_sous_categories = verify_right('edit_sous_categories')
      @destroy_sous_categories = verify_right('destroy_sous_categories')
      @sous_category = SousCategory.new
    else
      permission_denied
    end
  end

  # POST /categories
  # POST /categories.json
  # Should do the job for create the category.
  # The mthd create also an subcategory called 'Autre' because we need it.
  def create
    if verify_right('create_categories')
      @title = 'Nouvelle catégorie'
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.json { render json: @category.id, status: :created }
          format.html { redirect_to :back, notice: 'Catégorie crée avec succès.' }
          # Create an new subcategory for the category created.
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
          format.html { redirect_to :back, notice: 'Impossible de créer la catégorie ...' }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  # Should update the params of the category selected (passed in params).
  def update
    if verify_right('edit_categories')
      respond_to do |format|
        if @category.update(category_params)
          format.json { head :no_content }
          format.html { redirect_to :back, notice: 'Catégorie actualisée avec succès.' }
        else
          format.json { render json: @category.errors, status: :unprocessable_entity }
          format.html { render :back, notice: 'Impossible de modifier la catégorie ...' }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  # Should destroy the category selected (passed in params).
  # But only if it does not contains incidents.
  # Because if not, an thermo-nuclear war begin...
  def destroy
    if verify_right('destroy_categories')
      if Incident.where(category_id: @category.id).empty?
        @category.destroy!
        respond_to do |format|
          format.json { head :no_content }
          format.html { redirect_to categories_url, notice: 'Catégorie supprimée' }
        end
      else
        respond_to do |format|
          format.json { render json: 'Impossible de supprimer la catégorie car elle contient des incidents !', status: 409 }
          format.html { redirect_to categories_url, notice: 'Vous ne pouvez pas supprimer cette catégorie car elle contient des incidents !' }
        end
      end
    else
      permission_denied
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name)
  end
end
