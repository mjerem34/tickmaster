class SousCategoriesController < ApplicationController
  # Globally, this controller is used only for the future Windows app
  # Because for web, all it is managed by the CategoriesController.
  before_action :set_sous_category, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token
  before_action :set_expiration
  before_action :restrict_access

  # GET /sous_categories
  # GET /sous_categories.json
  # Should get and return all the subcategories
  def index
    @view_index_subcategories = verifRight('view_index_subcategories')
    if @view_index_subcategories
      @title = 'Liste des sous catégories'
      @sous_categories = SousCategory.all
      respond_to do |format|
        format.json { render json: @sous_categories }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /sous_categories/1
  # GET /sous_categories/1.json
  # Should return one subcategory, by id passed in params.
  def show
    @view_details_subcategories = verifRight('view_details_subcategories')
    if @view_details_subcategories
      @title = "Liste des incidents de sous catégorie : #{@sous_category.name}"
      respond_to do |format|
        format.json { render json: @sous_category }
        format.html { render :show }
      end
    else
      renderUnauthorized
    end
  end

  # GET /sous_categories/new
  # This should never be used.
  def new
    @create_new_subcategory = verifRight('create_new_subcategory')
    if @create_new_subcategory
      @title = 'Nouvelle sous catégorie'
      @sous_category = SousCategory.new
    else
      renderUnauthorized
    end
  end

  # GET /sous_categories/1/edit
  # This one too.
  def edit
    @edit_subcategories = verifRight('edit_subcategories')
    if @edit_subcategories
      @title = "Editer sous catégorie : #{@sous_category.name}"
      @category = Category.find(@sous_category.category_id)
    else
      renderUnauthorized
    end
  end

  # POST /sous_categories
  # POST /sous_categories.json
  # I think this method should create an subcategory... But I am not sure..
  def create
    @create_new_subcategory = verifRight('create_new_subcategory')
    if @create_new_subcategory
      @category = Category.find(params[:category_id])
      @sous_category = SousCategory.new(sous_category_params)
      # Any category have a 'lvl_urgence_max', for those who create an incident.
      # With that, we can determine how many an incident is important.
      @sous_category.lvl_urgence_max.nil? ? @sous_category.lvl_urgence_max = 10 : false
      respond_to do |format|
        if @sous_category.save
          format.json { render json: @sous_category.id, status: :created }
          format.html { redirect_to edit_category_path(@category), notice: 'Vous venez de créer une sous catégorie.' }
        else
          format.json { render json: @sous_category.errors, status: :unprocessable_entity }
          format.html { redirect_to :back, notice: 'Impossible de créer la sous catégorie.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /sous_categories/1
  # PATCH/PUT /sous_categories/1.json
  # Should update the params of the subcategory passed in params.
  def update
    @edit_subcategories = verifRight('edit_subcategories')
    if @edit_subcategories
      respond_to do |format|
        if @sous_category.update(sous_category_params)
          format.json { head :no_content }
          format.html { redirect_to :back, notice: 'Les paramètres de la sous catégorie ont été actualisés.' }
        else
          format.json { render json: @sous_category.errors, status: :unprocessable_entity }
          format.html { render :back, notice: "Impossible de modifier la sous catégorie : #{@sous_category.errors}" }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /sous_categories/1
  # DELETE /sous_categories/1.json
  # Should delete the subcategory passed in params only if contains no incidents.
  def destroy
    @delete_subcategories = verifRight('delete_subcategories')
    if @delete_subcategories
      respond_to do |format|
        if Incident.where(sous_category_id: @sous_category.id).empty?
          @sous_category.destroy
          format.json { head :no_content }
          format.html { redirect_to :back, notice: "La sous catégorie vient d'être supprimée." }
        else
          format.json { render json: 'Vous ne pouvez pas supprimer cette sous catégorie car elle contient des incidents.', status: :unprocessable_entity }
          format.html { redirect_to categories_url, notice: 'Vous ne pouvez pas supprimer cette sous catégorie car elle contient des incidents.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sous_category
    @sous_category = SousCategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sous_category_params
    params.require(:sous_category).permit(:name, :category_id, :lvl_urgence_max)
  end
end
