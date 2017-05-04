# categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: %i(show edit update destroy)
  before_action :set_expiration
  before_action :restrict_access
  before_action :no_incidents?, only: :destroy

  respond_to :json, :html

  # GET /categories
  # GET /categories.json
  def index
    verify_right('show_categories')
    verify_right('destroy_categories')
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
    respond_to do |format|
      format.json { render json: @category.sous_categories }
      format.html { redirect_to :edit_category }
    end
  end

  # GET /categories/1/edit
  def edit
    verify_right('show_sous_categories')
    verify_right('edit_sous_categories')
    verify_right('destroy_sous_categories')
    @sous_category = SousCategory.new
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.json { render json: @category.id, status: :created }
        format.html { redirect_to :back, notice: 'Création réussie !' }
      else
        format.json { render json: @category.errors, status: 422 }
        format.html { redirect_to :back, notice: 'Création impossible.' }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.json { head :no_content }
        format.html { redirect_to :back, notice: 'Modification réussie' }
      else
        format.json { render json: @category.errors, status: 422 }
        format.html { render :back, notice: 'Modification impossible' }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy!
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to categories_url, notice: 'Catégorie supprimée' }
    end
  end

  private

  def no_incidents?
    respond_with 'La catégorie contient des incidents' if @category
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
