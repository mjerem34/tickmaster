class SpecsTypesMaterialsController < ApplicationController
  before_action :set_spec_types_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /specs_types_materials
  # GET /specs_types_materials.json
  def index
    @view_spec_type_material = verifRight('view_spec_type_material')
    if @view_spec_type_material
      @title = 'Index'
      @specs_types_materials = SpecsTypesMaterial.all
      respond_to do |format|
        format.json { render json: @specs_types_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /specs_types_materials/1
  # GET /specs_types_materials/1.json
  def show
    @view_spec_type_material = verifRight('view_spec_type_material')
    if @view_spec_type_material
      @title = 'Show'
      respond_to do |format|
        format.json { render json: @specs_types_material }
        format.html { render :show }
      end
    else
      renderUnauthorized
    end
  end

  # GET /specs_types_materials/new
  def new
    @create_spec_type_material = verifRight('create_spec_type_material')
    if @create_spec_type_material
      @title = 'New'
      @specs_types_material = SpecsTypesMaterial.new
    else
      renderUnauthorized
    end
  end

  # GET /specs_types_materials/1/edit
  def edit
    @modify_spec_type_material = verifRight('modify_spec_type_material')
    if @modify_spec_type_material
      @title = 'Edit'
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
          format.json { render json: @specs_types_material.id }
          format.html { redirect_to @specs_types_material, notice: 'Le SpecTypeMaterial a bien été créé.' }
        else
          format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
          format.html { render :new, notice: 'Impossible de créer le SpecTypeMaterial.' }
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
          format.json { head :no_content }
          format.html { redirect_to @specs_types_material, notice: 'Specs types material was successfully updated.' }
        else
          format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier le SpecTypeMaterial.' }
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
        if @specs_types_material.destroy
          format.json { head :no_content }
          format.html { redirect_to specs_types_materials_url, notice: 'Specs types material was successfully destroyed.' }
        else
          format.json { render json: @specs_types_material.errors, status: :unprocessable_entity }
          format.html { redirect_to @specs_types_material, notice: 'Impossible de supprimer le SpecTypeMaterial' }
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
