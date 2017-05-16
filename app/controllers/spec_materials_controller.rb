# spec_materials_controller.rb
class SpecMaterialsController < ApplicationController
  before_action :set_spec_material, only: :destroy
  before_action :set_expiration
  before_action :restrict_access

  # GET /spec_materials
  # GET /spec_materials.json
  def index
    @spec_materials = SpecMaterial.all
    @spec_type_materials = SpecTypeMaterial.all
    respond_to do |format|
      format.json { render json: @spec_materials }
      format.html { render :index }
    end
  end

  # TODO: Implémenter la vue du create.js dans le spec_materials.js (reprendre un select_tag)
  # au dessus et le recopier (essayer d'enlever le champ déjà mis (a voir paske pas forcément
  # nécéssaire))

  # POST /spec_materials
  # POST /spec_materials.json
  def create
    @spec_material = CreateSpecMaterial.new(
      spec_type_material_name: params[:spec_material][:spec_type_material_name],
      spec_value: params[:spec_material][:spec_value]
    ).call
    render json: @spec_material.result,
           status: @spec_material.status
  end

  # PATCH/PUT /spec_materials/1
  # PATCH/PUT /spec_materials/1.json
  def update
    @spec_material = UpdateSpecMaterial.new(
      id: params[:id],
      spec_type_material_name: params[:spec_material][:spec_type_material_name],
      spec_value: params[:spec_material][:spec_value]
    ).call
    render json: @spec_material.result,
           status: @spec_material.status
  end

  # DELETE /spec_materials/1
  # DELETE /spec_materials/1.json
  def destroy
    if @spec_material.destroy
      render json: nil
    else
      render json: @spec_material.errors.full_messages.first
    end
  end

  private

  def set_spec_material
    @spec_material = SpecMaterial.find(params[:id])
  end

  def spec_material_params
    params.require(:spec_material).permit(:spec_type_material_name, :spec_value)
  end

  def materials_binded?
    render json: 'Un matériel est lié.', status: 422 if @spec_material
                                                        .spec_material_materials
                                                        .any?
  end
end
