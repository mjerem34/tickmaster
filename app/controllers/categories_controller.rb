# categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  
  before_action :restrict_access
  before_action :incidents_binded?, only: :destroy

  respond_to :json, :html

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @category = Category.new
    respond_to do |format|
      format.json { render json: @categories }
      format.html { render :index }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    render json: @category.sous_categories
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      @sous_category = @category.sous_categories.first
      render json: [@category.id, @sous_category.id], status: :created
    else
      render json: @category.errors.full_messages, status: 422
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if @category.update(category_params)
      render json: nil
    else
      render json: @category.errors.full_messages, status: 422
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.destroy
      render json: nil
    else
      render json: @category.errors.full_messages, status: 422
    end
  end

  private

  def incidents_binded?
    render json: ['Des incidents sont liés'], status: 422 if @category
                                                           .incidents
                                                           .exists?
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
