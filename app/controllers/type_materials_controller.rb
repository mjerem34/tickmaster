class TypeMaterialsController < ApplicationController
  before_action :set_type_material, only: %i[append_spec_type_material update destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /type_materials
  # GET /type_materials.json
  def index
    @view_type_material = verify_right('view_type_material')
    if @view_type_material
      @title = 'Types de matériel'
      @type_materials = TypeMaterial.all
      @spec_type_materials = SpecTypeMaterial.all
      respond_to do |format|
        format.json { render json: @type_materials }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # POST /type_materials
  # POST /type_materials.json
  def create
    @create_type_material = verify_right('create_type_material')
    if @create_type_material
      @type_material = TypeMaterial.new(type_material_params)
      respond_to do |format|
        if @type_material.save
          format.js
          format.json { render json: @type_material.id, status: :created }
        else
          format.json { render json: @type_material.errors.full_messages.first, status: :unprocessable_entity }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /type_materials/1
  # PATCH/PUT /type_materials/1.json
  def update
    @modify_type_material = verify_right('modify_type_material')
    if @modify_type_material
      respond_to do |format|
        if @type_material.update(type_material_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @type_material.errors.full_messages.first, status: :unprocessable_entity }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /type_materials/1
  # DELETE /type_materials/1.json
  def destroy
    @delete_type_material = verify_right('delete_type_material')
    if @delete_type_material
      respond_to do |format|
        if @type_material.materials.any?
          format.json { render json: 'Impossible de supprimer ce type de matériel car il est en liaison avec des matériels', status: :unprocessable_entity }
        elsif @type_material.type_material_sellers.any?
          format.json { render json: 'Impossible de supprimer ce type de matériel car il est en liaison avec des vendeurs', status: :unprocessable_entity }
        else
          if @type_material.destroy
            TypeMaterialSpecTypeMaterial.where(type_material_id: @type_material.id).delete_all
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @type_material.errors.full_messages.first, status: :unprocessable_entity }
          end
        end
      end
    else
      permission_denied
    end
  end

  # POST /type_materials/1/append_spec_type_material.json
  def append_spec_type_material
    @modify_type_material = verify_right('modify_type_material')
    if @modify_type_material
      @spec_type_material = SpecTypeMaterial.find_or_create_by(name: params[:spec_type_material][:name])
      respond_to do |format|
        if TypeMaterialSpecTypeMaterial.where(spec_type_material_id: @spec_type_material.id, type_material_id: @type_material.id).any?
          format.json { render json: "Impossible d'affecter ce type de caracteristique technique a ce type de matériel car il est déjà affecté.", status: :unprocessable_entity }
        else
          TypeMaterialSpecTypeMaterial.create(spec_type_material_id: @spec_type_material.id, type_material_id: @type_material.id)
          format.js
          format.json { head :no_content }
        end
      end
    else
      permission_denied
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_type_material
    @type_material = TypeMaterial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def type_material_params
    params.require(:type_material).permit(:name)
  end
end
