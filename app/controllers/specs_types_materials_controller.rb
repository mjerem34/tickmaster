class SpecsTypesMaterialsController < ApplicationController
  before_action :set_spec_types_material, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /specs_types_materials
  # GET /specs_types_materials.json
  def index
    @view_spec_type_material = verifRight('view_spec_type_material')
    if @view_spec_type_material
      @title = 'Types de caractéristiques techniques'
      @specs_types_materials = SpecsTypesMaterial.all
      respond_to do |format|
        format.json { render json: @specs_types_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /specs_types_materials
  # POST /specs_types_materials.json
  def create
    @create_spec_type_material = verifRight('create_spec_type_material')
    if @create_spec_type_material
      @title = 'Create'
      @specs_types_material = SpecsTypesMaterial.new(specs_types_material_params)

      respond_to do |format|
        if @specs_types_material.save
          format.js
          format.json { render json: @specs_types_material.id }
        else
          format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /specs_types_materials/1
  # PATCH/PUT /specs_types_materials/1.json
  def update
    @modify_spec_type_material = verifRight('modify_spec_type_material')
    if @modify_spec_type_material
      @title = 'Edit'
      respond_to do |format|
        if @specs_types_material.update(specs_types_material_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /specs_types_materials/1
  # DELETE /specs_types_materials/1.json
  def destroy
    @delete_spec_type_material = verifRight('delete_spec_type_material')
    if @delete_spec_type_material
      @title = 'Delete'
      respond_to do |format|
        # Faire tests
        if @specs_types_material.specs_materials.any?
          format.json do
            render json: 'Impossible de supprimer ce type de caractéristique technique '\
            'car il contient des caractéristiques liées.',
                   status: :unprocessable_entity
          end
        else
          if @specs_types_material.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
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
    @specs_types_material = SpecsTypesMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def specs_types_material_params
    params.require(:specs_types_material).permit(:name)
  end
end
