# spec_type_materials_controller.rb
class SpecTypeMaterialsController < ApplicationController
  before_action :set_spec_type_material, only: %i[update destroy]
  before_action :set_expiration
  before_action :restrict_access
  before_action :spec_materials_binded?, only: :destroy
  # GET /spec_type_materials
  # GET /spec_type_materials.json
  def index
    @spec_type_materials = SpecTypeMaterial.all
    respond_to do |format|
      format.json { render json: @spec_type_materials }
      format.html { render :index }
    end
  end

  # POST /spec_type_materials
  # POST /spec_type_materials.json
  def create
    @spec_type_material = SpecTypeMaterial.new(spec_type_material_params)
    if @spec_type_material.save
      render json: @spec_type_material.id, status: :created
    else
      render json: @spec_type_material.errors, status: 422
    end
  end

  # PATCH/PUT /spec_type_materials/1
  # PATCH/PUT /spec_type_materials/1.json
  def update
    if @spec_type_material.update(spec_type_material_params)
      render json: nil, status: 200
    else
      render json: @spec_type_material.errors, status: 422
    end
  end

  # DELETE /spec_type_materials/1
  # DELETE /spec_type_materials/1.json
  def destroy
    if @spec_type_material.destroy
      render json: nil, status: 200
    else
      render json: @spec_type_material.errors, status: 422
    end
  end

  private

  def set_spec_type_material
    @spec_type_material = SpecTypeMaterial.find(params[:id])
  end

  def spec_type_material_params
    params.require(:spec_type_material).permit(:name)
  end

  def spec_materials_binded?
    render json: 'Caractéristiques liées.', status: 422 if @spec_type_material
                                                           .spec_materials.any?
  end
end
