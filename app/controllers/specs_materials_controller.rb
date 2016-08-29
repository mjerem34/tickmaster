class SpecsMaterialsController < ApplicationController
  before_action :set_specs_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /specs_materials
  # GET /specs_materials.json
  def index
    @specs_materials = SpecsMaterial.all
  end

  # GET /specs_materials/1
  # GET /specs_materials/1.json
  def show
  end

  # GET /specs_materials/new
  def new
    @specs_material = SpecsMaterial.new
  end

  # GET /specs_materials/1/edit
  def edit
  end

  # POST /specs_materials
  # POST /specs_materials.json
  def create
    @specs_material = SpecsMaterial.new(specs_material_params)

    respond_to do |format|
      if @specs_material.save
        format.html { redirect_to @specs_material, notice: 'Specs material was successfully created.' }
        format.json { render :show, status: :created, location: @specs_material }
      else
        format.html { render :new }
        format.json { render json: @specs_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specs_materials/1
  # PATCH/PUT /specs_materials/1.json
  def update
    respond_to do |format|
      if @specs_material.update(specs_material_params)
        format.html { redirect_to @specs_material, notice: 'Specs material was successfully updated.' }
        format.json { render :show, status: :ok, location: @specs_material }
      else
        format.html { render :edit }
        format.json { render json: @specs_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specs_materials/1
  # DELETE /specs_materials/1.json
  def destroy
    @specs_material.destroy
    respond_to do |format|
      format.html { redirect_to specs_materials_url, notice: 'Specs material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specs_material
      @specs_material = SpecsMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specs_material_params
      params.require(:specs_material).permit(:spec_type_material_id, :spec_value)
    end
end
