class MaterialsController < ApplicationController
  before_action :restrict_access
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :set_detentor_type, only: [:index, :redefine_detentor_type]
  # GET /materials/get_all_specs_types
  def get_all_specs_types
    @all_specs_types = SpecsTypesMaterial.all
    respond_to do |format|
      format.json { render json: @all_specs_types }
    end
  end

  # GET /materials/get_all_fields_sellers
  def get_all_fields_sellers
    @all_fields_sellers = FieldsSeller.all
    respond_to do |format|
      format.json { render json: @all_fields_sellers }
    end
  end

  def redefine_seller_selected
    @seller = Seller.find(params[:id_seller]) if Seller.exists?(params[:id_seller])
    respond_to do |format|
      format.js
    end
  end

  # GET /materials
  # GET /materials.json
  # Should render all the materials.
  def index
    @view_material = verifRight('view_material')
    if @view_material
      @title = 'Matériels'
      @sellers_names_and_id = []
      @type_materials = TypeMaterial.all
      @specs_types_materials = []
      @type_materials.first.type_materials_specs_types_materials.each do |tmstm|
        @specs_types_materials << tmstm.specs_types_material
      end
      @seller = Seller.first
      Seller.all.each do |seller|
        seller.fields_seller_sellers.each do |fss|
          @sellers_names_and_id << fss if fss.fields_seller.name == 'Nom'
        end
      end

      @materials = Material.all
      respond_to do |format|
        format.json { render json: @materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  def redefine_type_material
    @specs_types_materials = []

    @type_materials = TypeMaterial.where(name: params[:type_material_name])
    unless @type_materials.first.nil?
      @type_materials.first.type_materials_specs_types_materials.each do |tmstm|
        @specs_types_materials << tmstm.specs_types_material
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def redefine_detentor_type
    respond_to do |format|
      format.js
    end
  end

  # GET /materials/1
  # GET /materials/1.json
  # Should render specs of one material.
  def show
    @view_material = verifRight('view_material')
    if @view_material
      @title = "Matériel n° #{@material.id}"
      respond_to do |format|
        format.json { render json: @material }
        format.html { render :show }
      end
    else
      renderUnauthorized
    end
  end

  # GET /materials/new
  def new
    @create_material = verifRight('create_material')
    if @create_material
      @title = 'Nouveau Matériel'
      @material = Material.new
    else
      renderUnauthorized
    end
  end

  # GET /materials/1/edit
  def edit
    @modify_material = verifRight('modify_material')
    if @modify_material
      @title = 'Editer matériel'
    else
      renderUnauthorized
    end
  end

  # POST /materials
  # POST /materials.json
  # Params :
  # material
  # seller_id
  # detentor_type_id
  # detentor_id
  # seller_specs
  # specs_values
  def create
    @create_material = verifRight('create_material')
    if @create_material
      if !params[:material][:type_material_name].blank? && !params[:seller_id].blank? && !params[:detentor_type_id].blank? && !params[:detentor_id].blank? && !params[:seller_specs].blank? && !params[:specs_values].blank?
        @title = 'Nouveau Matériel'
        Seller.exists?(id: params[:seller_id]) ? @seller = Seller.find(params[:seller_id]) : @seller = Seller.create
        TypeMaterial.exists?(name: params[:material][:type_material_name]) ? @type_material = TypeMaterial.where(name: params[:material][:type_material_name]).first : @type_material = TypeMaterial.create(name: params[:material][:type_material_name])
        TypesMaterialsSeller.create(type_material_id: @type_material.id, seller_id: @seller.id) unless TypesMaterialsSeller.exists?(type_material_id: @type_material.id, seller_id: @seller.id)
        params[:seller_specs].keys.each do |key|
          FieldsSeller.exists?(name: key) ? fields_seller = FieldsSeller.where(name: key).first : fields_seller = FieldsSeller.create!(name: key)
          FieldsSellerSeller.exists?(seller_id: @seller.id, fields_seller_id: fields_seller.id) ? FieldsSellerSeller.where(seller_id: @seller.id).first.update(content: params[:seller_specs][key]) : FieldsSellerSeller.create(fields_seller_id: fields_seller.id, seller_id: @seller.id, content: params[:seller_specs][key])
        end
        @material = Material.create(type_material_id: @type_material.id)
        MaterialsSeller.create(material_id: @material.id, seller_id: @seller.id)
        params[:specs_values].keys.each do |key|
          SpecsTypesMaterial.exists?(name: key) ? specs_types_material = SpecsTypesMaterial.where(name: key).first : specs_types_material = SpecsTypesMaterial.create(name: key)
          TypeMaterialsSpecsTypesMaterial.create(type_material_id: @type_material.id, spec_type_material_id: specs_types_material.id) unless TypeMaterialsSpecsTypesMaterial.exists?(type_material_id: @type_material.id, spec_type_material_id: specs_types_material.id)
          SpecsMaterial.exists?(spec_type_material_id: specs_types_material.id, spec_value: params[:specs_values][key]) ? spec_material = SpecsMaterial.where(spec_type_material_id: specs_types_material.id, spec_value: params[:specs_values][key]).first : spec_material = SpecsMaterial.create(spec_type_material_id: specs_types_material.id, spec_value: params[:specs_values][key])
          SpecMaterialMaterial.create(spec_material_id: spec_material.id, material_id: @material.id) unless SpecMaterialMaterial.exists?(spec_material_id: spec_material.id, material_id: @material.id)
        end

        respond_to do |format|
          format.json { render json: @material.id }
          format.html { redirect_to @material, notice: 'Le matériel a bien été créé.' }
        end
      else
        respond_to do |format|
          puts '-----------------------------------------------------------'
          format.json { render json: 'Impossible de créer le matériel, il manque des données.', status: :unprocessable_entity }
          format.html { redirect_to :back, notice: 'Impossible de créer le matériel, il manque des données.' }
        end
    end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    if verifRight('modify_material')
      respond_to do |format|
        if @material.update(material_params)
          format.json { head :no_content }
          format.html { redirect_to @material, notice: 'Le matériel a bien été mis à jour.' }
        else
          format.json { render json: @material.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier ce matériel ... Dommage !' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    if verifRight('delete_material')
      respond_to do |format|
        if @material.destroy
          format.json { head :no_content }
          format.html { redirect_to materials_url, notice: 'Matériel supprimé.' }
        else
          format.json { render json: @material.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de supprimer ce matériel.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  def set_detentor_type
    @detentor_types = DetentorType.all
    params[:id_detentor].nil? ? @detentor_type_selected = @detentor_types.first : @detentor_type_selected = DetentorType.find(params[:id_detentor])

    if [1, 4].include?(@detentor_type_selected.id.to_i)
      @possible_detentors = Agency.all.order(name: :asc)
    elsif [3].include?(@detentor_type_selected.id.to_i)
      @possible_detentors = User.where(tech_id: [2, 3, 4, 5]).order(name: :asc)
    else
      @possible_detentors = User.where.not(tech_id: [2, 3, 4, 5]).order(name: :asc)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def material_params
    params.require(:material).permit(:type_material_id)
  end
end
