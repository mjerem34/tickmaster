class TypeMaterialsController < ApplicationController
  before_action :set_type_material, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /type_materials
  # GET /type_materials.json
  def index
    @view_type_material = verifRight('view_type_material')
    if @view_type_material
      @title = 'Type material'
      @type_materials = TypeMaterial.all
      respond_to do |format|
        format.json { render json: @type_materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /type_materials/rely_type_material_to_seller
  def rely_type_material_to_seller
    TypeMaterial.exists?(name: params[:type_material][:name]) ? @type_material = TypeMaterial.where(name: params[:type_material][:name]).first : @type_material = TypeMaterial.create(name: params[:type_material][:name])
    if TypeMaterialSeller.exists?(type_material_id: @type_material.id, seller_id: params[:type_material][:seller_id])
      respond_to do |format|
        format.json { render json: nil, status: :unprocessable_entity }
      end
    else
      TypeMaterialSeller.create(type_material_id: @type_material.id, seller_id: params[:type_material][:seller_id])
      respond_to do |format|
        format.json { render json: @type_material.id, status: :ok }
      end
    end
  end

  # POST /type_materials
  # POST /type_materials.json
  def create
    @create_type_material = verifRight('create_type_material')
    if @create_type_material
      @title = 'Nouveau TypeMaterial'
      @type_material = TypeMaterial.new(type_material_params)
      respond_to do |format|
        if @type_material.save
          format.js
          format.json { render json: @type_material.id, status: :created }
        else
          format.json { render json: @type_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /type_materials/1
  # PATCH/PUT /type_materials/1.json
  def update
    @modify_type_material = verifRight('modify_type_material')
    if @modify_type_material
      @title = 'Editer TypeMaterial'
      respond_to do |format|
        if @type_material.update(type_material_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @type_material.errors, status: :unprocessable_entity }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /type_materials/1
  # DELETE /type_materials/1.json
  def destroy
    @delete_type_material = verifRight('delete_type_material')
    if @delete_type_material
      @title = 'Supprimer TypeMaterial'
      respond_to do |format|
        if @type_material.materials.any?
          format.json { render json: 'Impossible de supprimer ce type de matériel car il est en liaison avec des matériels', status: :unprocessable_entity }
        elsif @type_material.types_materials_sellers.any?
          format.json { render json: 'Impossible de supprimer ce type de matériel car il est en liaison avec des vendeurs', status: :unprocessable_entity }
        elsif @type_material.type_materials_specs_types_materials.any?
          format.json { render json: 'Impossible de supprimer ce type de matériel car il est en liaison avec des caractéristiques techniques', status: :unprocessable_entity }
        else
          if @type_material.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @type_material.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      renderUnauthorized
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
