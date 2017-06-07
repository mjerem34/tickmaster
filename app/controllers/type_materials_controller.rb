# type_materials_controller.rb
class TypeMaterialsController < ApplicationController
  before_action :set_type_material,
                only: %i[append_spec_type_material update destroy]
  
  before_action :restrict_access
  before_action :materials_binded?, only: %i[destroy]
  before_action :sellers_binded?, only: %i[destroy]
  # GET /type_materials
  # GET /type_materials.json
  def index
    @type_materials = TypeMaterial.all
    @spec_type_materials = SpecTypeMaterial.all
    respond_to do |format|
      format.json { render json: @type_materials }
      format.html { render :index }
    end
  end

  # POST /type_materials
  # POST /type_materials.json
  def create
    @type_material = TypeMaterial.new(type_material_params)
    if @type_material.save
      render json: @type_material.id, status: :created
    else
      render json: @type_material.errors.full_messages, status: 422
    end
  end

  # PATCH/PUT /type_materials/1
  # PATCH/PUT /type_materials/1.json
  def update
    if @type_material.update(type_material_params)
      render json: nil
    else
      render json: @type_material.errors.full_messages, status: 422
    end
  end

  # DELETE /type_materials/1
  # DELETE /type_materials/1.json
  def destroy
    if @type_material.destroy
      render json: nil
    else
      render json: @type_material.errors.full_messages, status: 422
    end
  end

  # POST /type_materials/1/append_spec_type_material.json
  def append_spec_type_material
    @spec_type_material = AppendSpecTypeMaterial.new(
      params[:id],
      params[:spec_type_material][:name]
    ).call
    render json: @spec_type_material.result, status: @spec_type_material.status
  end

  private

  def set_type_material
    @type_material = TypeMaterial.find(params[:id])
  end

  def type_material_params
    params.require(:type_material).permit(:name)
  end

  def materials_binded?
    render json: 'Des matériels sont liés', status: 422 if @type_material
                                                           .materials
                                                           .any?
  end

  def sellers_binded?
    render json: 'Des vendeurs sont liés', status: 422 if @type_material
                                                          .type_material_sellers
                                                          .any?
  end
end
