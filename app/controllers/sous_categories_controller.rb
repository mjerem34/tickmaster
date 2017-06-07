# Globally, this controller is used only for the future Windows app
# Because for web, all it is managed by the CategoriesController.
class SousCategoriesController < ApplicationController
  before_action :set_sous_category, only: %i[show edit update destroy]
  
  before_action :restrict_access
  before_action :incidents_binded?, only: :destroy

  # GET /sous_categories.json
  def index
    render json: SousCategory.all
  end

  # GET /sous_categories/1.json
  def show
    render json: @sous_category
  end

  # POST /sous_categories.json
  def create
    @sous_category = SousCategory.new(sous_category_params)
    if @sous_category.save
      render json: @sous_category.id, status: 201
    else
      render json: @sous_category.errors.full_messages, status: 422
    end
  end

  # PATCH/PUT /sous_categories/1.json
  def update
    if @sous_category.update(sous_category_params)
      render json: nil
    else
      render json: @sous_category.errors.full_messages, status: 422
    end
  end

  # DELETE /sous_categories/1.json
  def destroy
    if @sous_category.destroy
      render json: nil
    else
      render json: @sous_category.errors.full_messages, status: 422
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
    render json: ["Des incidents sont liés"], status: 422 if @sous_category
                                                           .incidents.any?
  end
end
