class SpecsTypesMaterialsController < ApplicationController
  before_action :set_specs_types_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /specs_types_materials
  # GET /specs_types_materials.json
  def index
    @specs_types_materials = SpecsTypesMaterial.all
  end

  # GET /specs_types_materials/1
  # GET /specs_types_materials/1.json
  def show
  end

  # GET /specs_types_materials/new
  def new
    @specs_types_material = SpecsTypesMaterial.new
  end

  # GET /specs_types_materials/1/edit
  def edit
  end

  # POST /specs_types_materials
  # POST /specs_types_materials.json
  def create
    @specs_types_material = SpecsTypesMaterial.new(specs_types_material_params)

    respond_to do |format|
      if @specs_types_material.save
        format.html { redirect_to @specs_types_material, notice: 'Specs types material was successfully created.' }
        format.json { render :show, status: :created, location: @specs_types_material }
      else
        format.html { render :new }
        format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specs_types_materials/1
  # PATCH/PUT /specs_types_materials/1.json
  def update
    respond_to do |format|
      if @specs_types_material.update(specs_types_material_params)
        format.html { redirect_to @specs_types_material, notice: 'Specs types material was successfully updated.' }
        format.json { render :show, status: :ok, location: @specs_types_material }
      else
        format.html { render :edit }
        format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specs_types_materials/1
  # DELETE /specs_types_materials/1.json
  def destroy
    @specs_types_material.destroy
    respond_to do |format|
      format.html { redirect_to specs_types_materials_url, notice: 'Specs types material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specs_types_material
      @specs_types_material = SpecsTypesMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specs_types_material_params
      params.require(:specs_types_material).permit(:name)
    end
end
