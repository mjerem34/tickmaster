class SousCategoriesController < ApplicationController
  before_action :set_sous_category, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /sous_categories
  # GET /sous_categories.json
  def index
    @sous_categories = SousCategory.all
  end

  # GET /sous_categories/1
  # GET /sous_categories/1.json
  def show
  end

  # GET /sous_categories/new
  def new
    @sous_category = SousCategory.new
  end

  # GET /sous_categories/1/edit
  def edit
  end

  # POST /sous_categories
  # POST /sous_categories.json
  def create
    @sous_category = SousCategory.new(sous_category_params)
    @sous_category.lvl_urgence_max.nil? ? @sous_category.lvl_urgence_max = 10 : false
    respond_to do |format|
      if @sous_category.save
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @sous_category }
      else
        format.html { redirect_to :back }
      end
    end
  end

  # PATCH/PUT /sous_categories/1
  # PATCH/PUT /sous_categories/1.json
  def update
    respond_to do |format|
      if @sous_category.update(sous_category_params)
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @sous_category }
      else
        format.html { render :edit }
        format.json { render json: @sous_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sous_categories/1
  # DELETE /sous_categories/1.json
  def destroy
    if Incident.where(sous_category_id: @sous_category.id).pluck(:title).join('') == ''
      @sous_category.destroy!
      respond_to do |format|
        format.html { redirect_to sous_categories_path }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to sous_categories_path }
        format.json { head :no_content }
      end
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
