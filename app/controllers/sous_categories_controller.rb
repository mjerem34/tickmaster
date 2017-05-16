# Globally, this controller is used only for the future Windows app
# Because for web, all it is managed by the CategoriesController.
class SousCategoriesController < ApplicationController
  before_action :set_sous_category, only: %i[show edit update destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /sous_categories
  # GET /sous_categories.json
  def index
    @sous_categories = SousCategory.all
    verify_right('show_sous_categories')
    verify_right('edit_sous_categories')
    verify_right('destroy_sous_categories')
    respond_to do |format|
      format.json { render json: @sous_categories }
      format.html { render :index }
    end
  end

  # GET /sous_categories/1
  # GET /sous_categories/1.json
  def show
    render json: @sous_category
  end

  # POST /sous_categories
  # POST /sous_categories.json
  # I think this method should create an subcategory... But I am not sure..
  def create
    @category = Category.find(params[:sous_category][:category_id])
    @sous_category = SousCategory.new(sous_category_params)
    if @sous_category.save
      render json: @sous_category.id, status: 201
    else
      render json: @sous_category.errors, status: 422
    end
  end

  # PATCH/PUT /sous_categories/1
  # PATCH/PUT /sous_categories/1.json
  def update
    if @sous_category.update(sous_category_params)
      render json: nil
    else
      render json: @sous_category.errors, status: 422
    end
  end

  # DELETE /sous_categories/1
  # DELETE /sous_categories/1.json
  def destroy
    if @sous_category.destroy
      render json: nil
    else
      render json: nil, status: 422
    end
  end

  private

  def set_sous_category
    @sous_category = SousCategory.find(params[:id])
  end

  def sous_category_params
    params.require(:sous_category).permit(:name, :category_id, :lvl_urgence_max)
  end

  def incidents_binded?
    render json: 'Des incidents sont liés', status: 422 if @sous_category
                                                           .incidents.any?
  end
end
