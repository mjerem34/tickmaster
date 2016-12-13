class SpecMaterialsController < ApplicationController
  before_action :set_spec_material, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /spec_materials
  # GET /spec_materials.json
  def index
    @view_spec_material = verifRight('view_spec_material')
    if @view_spec_material
      @title = 'Caractéristiques techniques'
      @spec_type_materials = SpecTypeMaterial.all
      @spec_materials = SpecMaterial.all
      respond_to do |format|
        format.json { render json: @spec_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /spec_materials
  # POST /spec_materials.json
  def create
    @create_spec_material = verifRight('create_spec_material')
    if @create_spec_material
      @title = 'Nouveau SpecMaterial'
      @spec_type_material = SpecTypeMaterial.find_or_create_by(name: params[:spec_material][:spec_type_material_name])
      @spec_type_materials = SpecTypeMaterial.all
      @spec_material = SpecMaterial.new(spec_type_material_id: @spec_type_material.id, spec_value: params[:spec_material][:spec_value])
      respond_to do |format|
        if @spec_material.save
          format.js
          format.json { render json: @spec_material.id, status: :created }
        else
          format.json { render json: @spec_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /spec_materials/1
  # PATCH/PUT /spec_materials/1.json
  def update
    @modify_spec_material = verifRight('modify_spec_material')
    if @modify_spec_material
      @title = "Editer SpecMaterial n° #{@spec_material.id}"
      respond_to do |format|
        @spec_type_material = SpecTypeMaterial.find_or_create_by(name: params[:spec_material][:spec_type_material_name])
        if @spec_material.update(spec_type_material_id: @spec_type_material.id, spec_value: params[:spec_material][:spec_value])
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @spec_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /spec_materials/1
  # DELETE /spec_materials/1.json
  def destroy
    @delete_spec_material = verifRight('delete_spec_material')
    if @delete_spec_material
      @title = 'Supprimer un SpecMaterial'
      respond_to do |format|
        if @spec_material.spec_material_materials.any?
          format.json do
            render json: "Impossible de supprimer cette caractéristique car '\
            'elle est liée a un matériel.",
                   status: :unprocessable_entity
          end
        else
          if @spec_material.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @spec_material.errors }
          end
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spec_material
    @spec_material = SpecMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def spec_material_params
    params.require(:spec_material).permit(:spec_type_material_name, :spec_value)
  end
end
