class SpecsMaterialsController < ApplicationController
  before_action :set_specs_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /specs_materials
  # GET /specs_materials.json
  def index
    @view_spec_material = verifRight('view_spec_material')
    if @view_spec_material
      @title = 'SpecMaterial'
      @specs_materials = SpecsMaterial.all
      respond_to do |format|
        format.json { render json: @specs_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /specs_materials/1
  # GET /specs_materials/1.json
  def show
    @view_spec_material = verifRight('view_spec_material')
    if @view_spec_material
      @title = "SpecMaterial n° #{@specs_material.id}"
      respond_to do |format|
        format.json { render json: @specs_material }
        format.html { render :show }
      end
    else
      renderUnauthorized
    end
  end

  # GET /specs_materials/new
  def new
    @create_spec_material = verifRight('create_spec_material')
    if @create_spec_material
      @title = 'Nouveau SpecMaterial'
      @specs_material = SpecsMaterial.new
    else
      renderUnauthorized
    end
  end

  # GET /specs_materials/1/edit
  def edit
    @modify_spec_material = verifRight('modify_spec_material')
    if @modify_spec_material
      @title = "Editer SpecMaterial n° #{@specs_material.id}"
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
      @specs_material = SpecsMaterial.new(specs_material_params)
      respond_to do |format|
        if @specs_material.save
          format.json { render json: @specs_material.id, status: :created }
          format.html { redirect_to @specs_material, notice: 'Le SpecMaterial a bien été créé.' }
        else
          format.json { render json: @specs_material.errors, status: :unprocessable_entity }
          format.html { render :new, notice: 'Impossible de créer le SpecMaterial.' }
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
        if @specs_material.update(specs_material_params)
          format.json { head :no_content }
          format.html { redirect_to @specs_material, notice: 'Le SpecMaterial a bien été modifié.' }
        else
          format.json { render json: @specs_material.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier ce SpecMaterial.' }
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
        if @specs_material.destroy
          format.json { head :no_content }
          format.html { redirect_to specs_materials_url, notice: 'Le SpecMaterial a bien été supprimé.' }
        else
          format.json { render json: @specs_material.errors }
          format.html { redirect_to specs_materials_url, notice: 'Impossible de supprimer le SpecMaterial.' }
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
    params.require(:specs_material).permit(:spec_type_material_id, :spec_value)
  end
end
