class MaterialsController < ApplicationController
  before_action :restrict_access
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration

  # GET /materials
  # GET /materials.json
  # Should render all the materials.
  def index
    @view_material = verifRight('view_material')
    if @view_material
      @title = 'Matériels'

      @type_materials = TypeMaterial.all
      type_materials_specs_types_materials = @type_materials.first.type_materials_specs_types_materials.all

      @specs_types_materials = []
      type_materials_specs_types_materials.each do |tmstm|
        @specs_types_materials << tmstm.specs_types_material
      end

      @sellers = []
      @type_materials.first.types_materials_sellers.each do |a|
        @sellers << a.seller
      end
      @seller = @sellers.first
      @titles_fields_sellers = []
      @values_fields_sellers = @seller.fields_seller_sellers.all
      @values_fields_sellers.each do |vfs|
        @titles_fields_sellers << vfs.fields_seller
      end

      # This for the dropdown list, it list all the names of the sellers.
      @sellers_names_and_id = []
      @sellers.each do |seller|
        seller.fields_seller_sellers.each do |fss|
          fss.fields_seller.inspect
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

  def redefine_seller_selected
    @type_materials = TypeMaterial.all
    @sellers = []
    @type_materials.first.types_materials_sellers.each do |a|
      @sellers << a.seller
    end
    @seller = @sellers.select { |seller| seller.id == params[:id_seller] }
    puts '______________________'
    puts @sellers.select { |seller| seller.id == params[:id_seller] }
    puts '______________________'
    # TODO: Voir pourquoi @seller ne se rempli pas avec le select, Cette fonction doit renvoyer un seul vendeur, pour récuperer les champs dans la vue.
    respond_to do |format|
      format.js
    end
  end

  def redefine_type_material
    @type_materials = TypeMaterial.find(params[:type_material_id])
    type_materials_specs_types_materials = @type_materials.type_materials_specs_types_materials.all
    @specs_types_materials = []
    type_materials_specs_types_materials.each do |tmstm|
      @specs_types_materials << tmstm.specs_types_material
    end
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
  def create
    @create_material = verifRight('create_material')
    if @create_material
      @title = 'Nouveau Matériel'
      @material = Material.new(material_params)
      respond_to do |format|
        if @material.save
          format.json { render json: @material.id }
          format.html { redirect_to @material, notice: 'Le matériel a bien été créé.' }
        else
          format.json { render json: @material.errors, status: :unprocessable_entity }
          format.html { render :new, notice: 'Impossible de créer le matériel.' }
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

  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def material_params
    params.require(:material).permit(:type_material_id, :detentor_type_id, :detentor_id, :seller_id, :date)
  end
end
