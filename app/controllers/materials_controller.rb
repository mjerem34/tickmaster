class MaterialsController < ApplicationController
  before_action :restrict_access
  before_action :set_material, only: %i[show edit update destroy]
  
  before_action :set_detentor_type, only: %i[new redefine_detentor_type]
  # GET /materials/get_all_specs_types
  # TODO : Replace with the spec_type_materials#index
  def get_all_specs_types
    @all_specs_types = SpecTypeMaterial.all
    respond_to do |format|
      format.json { render json: @all_specs_types }
    end
  end

  # GET /materials/get_all_type_materials.json
  # TODO : Replace with the type_materials#index
  def get_all_type_materials
    @type_materials = TypeMaterial.all
    @seller_id = params[:seller_id]
    respond_to do |format|
      format.js
    end
  end

  # GET /materials/redefine_seller_selected
  # TODO : Replace with seller#show
  def redefine_seller_selected
    @seller = Seller.find(params[:id_seller]) if Seller.exists?(params[:id_seller])
    respond_to do |format|
      format.js
    end
  end

  # TODO : service object from this
  def redefine_material_selected
    @material = Material.find(params[:material_id])
    @material_specs = {}
    @material.spec_material_materials.each do |smm|
      @material_specs[smm.spec_material.spec_type_material.name] = smm.spec_material.spec_value
    end
    respond_to do |format|
      format.js
    end
  end

  # GET /materials
  # GET /materials.json
  # Should render all the materials.
  def index
    @materials = Material.all
    respond_to do |format|
      format.json { render json: @materials }
      format.html { render :index }
    end
  end

  def redefine_type_material
    @type_materials = TypeMaterial.where(name: params[:type_material_name])
    respond_to do |format|
      if @type_materials.first.nil?
        format.json { render json: "Ce type de matériel n'existe pas, il sera créé.", status: 422 }
      else
        @all_materials = Material.where(type_material_id: @type_materials.first.id)
        @materials = @all_materials.select(:name).uniq.each { |mat| mat.id = @all_materials.where(name: mat.name).first.id }
        @material_specs = {}
        if @materials.any?
          @material = @materials.first
          @material.spec_material_materials.each do |smm|
            @material_specs[smm.spec_material.spec_type_material.name] = smm.spec_material.spec_value
          end
          format.js
        else
          format.json { render json: 'Ce type de matériel ne possède pas de modèle', status: :ok }
        end
      end
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
    @view_material = verify_right('view_material')
    if @view_material
      respond_to do |format|
        format.json { render json: @material }
        format.html { render :show }
      end
    else
      permission_denied
    end
  end

  # GET /materials/new
  def new
    @create_material = verify_right('create_material')
    if @create_material
      @type_materials = TypeMaterial.all
      @type_material = @type_materials.first
      @all_materials = Material.where(type_material_id: @type_material.id)
      @materials = @all_materials.select(:name).uniq.each { |mat| mat.id = @all_materials.where(name: mat.name).first.id }
      @material = @materials.first
      @material_specs = {}
      @material.spec_material_materials.each do |smm|
        @material_specs[smm.spec_material.spec_type_material.name] = smm.spec_material.spec_value
        puts '---------------------------------'
        puts @material_specs.inspect
        puts '---------------------------------'
      end
      @sellers = Seller.where(actif: true)
      @seller = @sellers.first
    else
      permission_denied
    end
  end

  def edit
    # TODO : Reintegrate !
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
    @create_material = verify_right('create_material')
    if @create_material
      if !params[:material][:type_material_name].blank? && !params[:material][:material_name].blank? && !params[:seller_name].blank? && !params[:detentor_type_id].blank? && !params[:detentor_id].blank? && !params[:seller_specs].blank? && !params[:specs_values].blank?
        Seller.exists?(name: params[:seller_name]) ? @seller = Seller.where(name: params[:seller_name]).first : @seller = Seller.create(name: params[:seller_name])
        TypeMaterial.exists?(name: params[:material][:type_material_name]) ? @type_material = TypeMaterial.where(name: params[:material][:type_material_name]).first : @type_material = TypeMaterial.create(name: params[:material][:type_material_name])
        TypeMaterialSeller.create(type_material_id: @type_material.id, seller_id: @seller.id) unless TypeMaterialSeller.exists?(type_material_id: @type_material.id, seller_id: @seller.id)
        params[:seller_specs].keys.each do |key|
          FieldSeller.exists?(name: key) ? field_seller = FieldSeller.where(name: key).first : field_seller = FieldSeller.create!(name: key)
          FieldSellerSeller.exists?(seller_id: @seller.id, field_seller_id: field_seller.id) ? FieldSellerSeller.where(seller_id: @seller.id).first.update(content: params[:seller_specs][key]) : FieldSellerSeller.create(field_seller_id: field_seller.id, seller_id: @seller.id, content: params[:seller_specs][key])
        end
        @material = Material.create(type_material_id: @type_material.id, name: params[:material][:material_name])
        MaterialsSeller.create(material_id: @material.id, seller_id: @seller.id)
        params[:specs_values].keys.each do |key|
          SpecTypeMaterial.exists?(name: key) ? spec_type_material = SpecTypeMaterial.where(name: key).first : spec_type_material = SpecTypeMaterial.create(name: key)
          TypeMaterialsSpecTypeMaterial.create(type_material_id: @type_material.id, spec_type_material_id: spec_type_material.id) unless TypeMaterialsSpecTypeMaterial.exists?(type_material_id: @type_material.id, spec_type_material_id: spec_type_material.id)
          SpecMaterial.exists?(spec_type_material_id: spec_type_material.id, spec_value: params[:specs_values][key]) ? spec_material = SpecMaterial.where(spec_type_material_id: spec_type_material.id, spec_value: params[:specs_values][key]).first : spec_material = SpecMaterial.create(spec_type_material_id: spec_type_material.id, spec_value: params[:specs_values][key])
          SpecMaterialMaterial.create(spec_material_id: spec_material.id, material_id: @material.id) unless SpecMaterialMaterial.exists?(spec_material_id: spec_material.id, material_id: @material.id)
        end

        respond_to do |format|
          format.json { render json: @material.id }
          format.html { redirect_to @material, notice: 'Le matériel a bien été créé.' }
        end
      else
        respond_to do |format|
          format.json { render json: 'Impossible de créer le matériel, il manque des données.', status: 422 }
          format.html { redirect_to :back, notice: 'Impossible de créer le matériel, il manque des données.' }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    if verify_right('modify_material')
      respond_to do |format|
        if @material.update(material_params)
          format.json { head :no_content }
          format.html { redirect_to @material, notice: 'Le matériel a bien été mis à jour.' }
        else
          format.json { render json: @material.errors.full_messages, status: 422 }
          format.html { render :edit, notice: 'Impossible de modifier ce matériel ... Dommage !' }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    if verify_right('delete_material')
      respond_to do |format|
        if @material.destroy
          format.json { head :no_content }
          format.html { redirect_to materials_url, notice: 'Matériel supprimé.' }
        else
          format.json { render json: @material.errors.full_messages, status: 422 }
          format.html { render :edit, notice: 'Impossible de supprimer ce matériel.' }
        end
      end
    else
      permission_denied
    end
  end

  private

  def set_detentor_type
    @detentor_types = DetentorType.all
    params[:id_detentor].nil? ? @detentor_type_selected = @detentor_types.first : @detentor_type_selected = DetentorType.find(params[:id_detentor])

    if [1, 4].include?(@detentor_type_selected.id.to_i)
      # Alors c'est une agence ou la réserve
      @possible_detentors = Agency.all.order(name: :asc)
    elsif [3].include?(@detentor_type_selected.id.to_i)
      # Alors c'est un technicien
      @possible_detentors = User.joins(:type_user).where('type_users.is_tech=1').order(name: :asc)
    else
      # Alors ce n'est pas un technicien
      @possible_detentors = User.joins(:type_user).where('type_users.is_tech=0').order(name: :asc)
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
