class SpecsMaterialsController < ApplicationController
  before_action :set_specs_material, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /specs_materials
  # GET /specs_materials.json
  def index
    @view_spec_material = verifRight('view_spec_material')
    if @view_spec_material
      @title = 'Caractéristiques techniques'
      @specs_types_materials = SpecsTypesMaterial.all
      @specs_materials = SpecsMaterial.all
      respond_to do |format|
        format.json { render json: @specs_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /specs_materials
  # POST /specs_materials.json
  def create
    @create_spec_material = verifRight('create_spec_material')
    if @create_spec_material
      @title = 'Nouveau SpecMaterial'
      @specs_types_material = SpecsTypesMaterial.find_or_create_by(name: params[:specs_material][:specs_types_material_name])
      @specs_types_materials = SpecsTypesMaterial.all
      @specs_material = SpecsMaterial.new(specs_types_material_id: @specs_types_material.id, spec_value: params[:specs_material][:spec_value])
      respond_to do |format|
        if @specs_material.save
          format.js
          format.json { render json: @specs_material.id, status: :created }
        else
          format.json { render json: @specs_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /specs_materials/1
  # PATCH/PUT /specs_materials/1.json
  def update
    @modify_spec_material = verifRight('modify_spec_material')
    if @modify_spec_material
      @title = "Editer SpecMaterial n° #{@specs_material.id}"
      respond_to do |format|
        @specs_types_material = SpecsTypesMaterial.find_or_create_by(name: params[:specs_material][:specs_types_material_name])
        if @specs_material.update(specs_types_material_id: @specs_types_material.id, spec_value: params[:specs_material][:spec_value])
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @specs_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /specs_materials/1
  # DELETE /specs_materials/1.json
  def destroy
    @delete_spec_material = verifRight('delete_spec_material')
    if @delete_spec_material
      @title = 'Supprimer un SpecMaterial'
      respond_to do |format|
        if @specs_material.spec_material_materials.any?
          format.json do
            render json: "Impossible de supprimer cette caractéristique car '\
            'elle est liée a un matériel.",
                   status: :unprocessable_entity
          end
        else
          if @specs_material.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @specs_material.errors }
          end
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_specs_material
    @specs_material = SpecsMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def specs_material_params
    params.require(:specs_material).permit(:specs_types_material_name, :spec_value)
  end
end
