class TypeMaterialsController < ApplicationController
  before_action :set_type_material, only: [:show, :edit, :update, :destroy]
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
    if TypesMaterialsSeller.exists?(type_material_id: @type_material.id, seller_id: params[:type_material][:seller_id])
      respond_to do |format|
        format.json { render json: nil, status: :unprocessable_entity }
      end
    else
      TypesMaterialsSeller.create(type_material_id: @type_material.id, seller_id: params[:type_material][:seller_id])
      respond_to do |format|
        format.json { render json: @type_material.id, status: :ok }
      end
    end
  end

  # GET /type_materials/1
  # GET /type_materials/1.json
  def show
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # GET /type_materials/new
  def new
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # GET /type_materials/1/edit
  def edit
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
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
          format.json { render json: @type_material.id, status: :created }
          format.html { redirect_to @type_material, notice: 'Le TypeMaterial a bien été créé.' }
        else
          format.json { render json: @type_material.errors, status: :unprocessable_entity }
          format.html { render :new, notice: 'Impossible de créer le TypeMaterial.' }
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
          format.json { head :no_content }
          format.html { redirect_to @type_material, notice: 'Le TypeMaterial a bien été édité.' }
        else
          format.json { render json: @type_material.errors, status: :unprocessable_entity }
          format.html { render :edit, "Impossible d'éditer le TypeMaterial." }
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
        if @type_material.destroy
          format.json { head :no_content }
          format.html { redirect_to type_materials_url, notice: 'Le TypeMaterial a bien été supprimé.' }
        else
          format.json { render json: @type_material.errors, status: :unprocessable_entity }
          format.html { redirect_to type_materials_url, notice: 'Impossible de supprimer le TypeMaterial.' }
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
