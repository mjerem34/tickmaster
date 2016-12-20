class SpecTypeMaterialsController < ApplicationController
  before_action :set_spec_types_material, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /spec_type_materials
  # GET /spec_type_materials.json
  def index
    @view_spec_type_material = verifRight('view_spec_type_material')
    if @view_spec_type_material
      @title = 'Types de caractéristiques techniques'
      @spec_type_materials = SpecTypeMaterial.all
      respond_to do |format|
        format.json { render json: @spec_type_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /spec_type_materials
  # POST /spec_type_materials.json
  def create
    @create_spec_type_material = verifRight('create_spec_type_material')
    if @create_spec_type_material
      @title = 'Create'
      @spec_type_material = SpecTypeMaterial.new(spec_type_material_params)

      respond_to do |format|
        if @spec_type_material.save
          format.js
          format.json { render json: @spec_type_material.id }
        else
          format.json { render json: @spec_type_material.errors.full_messages.first, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /spec_type_materials/1
  # PATCH/PUT /spec_type_materials/1.json
  def update
    @modify_spec_type_material = verifRight('modify_spec_type_material')
    if @modify_spec_type_material
      @title = 'Edit'
      respond_to do |format|
        if @spec_type_material.update(spec_type_material_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @spec_type_material.errors.full_messages.first, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /spec_type_materials/1
  # DELETE /spec_type_materials/1.json
  def destroy
    @delete_spec_type_material = verifRight('delete_spec_type_material')
    if @delete_spec_type_material
      @title = 'Delete'
      respond_to do |format|
        # Faire tests
        if @spec_type_material.spec_materials.any?
          format.json do
            render json: 'Impossible de supprimer ce type de caractéristique technique '\
            'car il contient des caractéristiques liées.',
                   status: :unprocessable_entity
          end
        else
          if @spec_type_material.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @spec_type_material.errors.full_messages.first, status: :unprocessable_entity }
          end
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spec_types_material
    @spec_type_material = SpecTypeMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def spec_type_material_params
    params.require(:spec_type_material).permit(:name)
  end
end
