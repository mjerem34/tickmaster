class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /sellers
  # GET /sellers.json
  def index
    @view_sellers = verifRight('view_sellers')
    if @view_sellers
      @title = 'Vendeurs'
      @sellers = Seller.all
      respond_to do |format|
        format.json { render json: @sellers }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /sellers/get_all_fields_sellers.json
  def get_all_fields_sellers
    fssFind = []
    @seller_id = params[:seller_id]
    Seller.find(@seller_id).fields_seller_sellers.each do |fss|
      # Get all fields already defined to the seller to remove them
      fssFind << fss.fields_seller.id
    end
    # Select all fields except those already defined (fssFind)
    @all_fields_sellers = FieldsSeller.where.not(id: fssFind)
    respond_to do |format|
      format.js
    end
  end

  # GET /sellers/get_all_type_materials.json
  def get_all_type_materials
    @type_materials = TypeMaterial.all
    @seller_id = params[:seller_id]
    respond_to do |format|
      format.js
    end
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # GET /sellers/new
  def new
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # GET /sellers/1/edit
  def edit
    respond_to do |format|
      format.json { render json: nil, status: 404 }
      format.html { redirect_to fields_sellers_url }
    end
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @create_sellers = verifRight('create_sellers')
    if @create_sellers
      @title = 'Nouveau vendeur'
      @seller = Seller.new(seller_params)
      respond_to do |format|
        if @seller.save
          format.json { render json: @seller.id, status: :created }
          format.html { redirect_to @seller, notice: 'Le vendeur a bien été créé.' }
        else
          format.json { render json: @seller.errors, status: :unprocessable_entity }
          format.html { render :new, notice: 'Impossible de créer le vendeur.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    @modify_sellers = verifRight('modify_sellers')
    if @modify_sellers
      @title = "Editer vendeur n° #{@seller.id}"
      respond_to do |format|
        if @seller.update(seller_params)
          format.json { head :no_content }
          format.html { redirect_to @seller, notice: 'Le vendeur a bien été edité.' }
        else
          format.json { render json: @seller.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: "Impossible d'editer le vendeur." }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @delete_sellers = verifRight('delete_sellers')
    if @delete_sellers
      @title = 'Désactivation/Activation vendeur'
      respond_to do |format|
        if @seller.actif
          @seller.update(actif: false)
          format.json { head :no_content }
          format.html { redirect_to sellers_url, notice: 'Le vendeur a bien été désactivé ! <br> Il ne vendra plus jamais quoi que ce soit... Mouahahahahahaha !!!' }
        else
          @seller.update(actif: true)
          format.json { head :no_content }
          format.html { redirect_to sellers_url, notice: 'Le vendeur a bien été activé !' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /sellers/1/delete_type_material
  def delete_type_material
    @delete_type_material_seller = verifRight('delete_type_material_seller')
    if @delete_type_material_seller
      respond_to do |format|
        @type_material_seller = TypeMaterialSeller.where(type_material_id: params[:type_material_id], seller_id: params[:id])
        if @type_material_seller.nil?
          format.json { render json: 'Impossible de supprimer ce qui n\'existe pas...', status: 404 }
        else
          if @type_material_seller.delete_all
            format.json { head :no_content }
          else
            format.json { render json: @seller.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      renderUnauthorized
    end
  end

  # POST /sellers/1/add_field_seller
  def add_field_seller
    @modify_sellers = verifRight('modify_sellers')
    if @modify_sellers
      if !FieldsSeller.exists?(name: params[:field_seller_name])
        @field_seller = FieldsSeller.new(name: params[:field_seller_name])
        @field_seller.save
        @field_seller_seller = FieldsSellerSeller.new(fields_seller_id: @field_seller.id, seller_id: params[:id], content: params[:content])
      else
        @field_seller_seller = FieldsSellerSeller.new(fields_seller_id: params[:field_seller_id], seller_id: params[:id], content: params[:content])
      end
      if @field_seller_seller.save
        respond_to { |format| format.json { render json: @field_seller_seller.fields_seller_id, status: :ok } }
      else
        respond_to { |format| format.json { render json: "Impossible de d'ajouter ce champ, contactez votre administrateur réseau", status: :unprocessable_entity } }
      end
    else
      renderUnauthorized
    end
  end

  # PUT /sellers/1/update_field_seller
  def update_field_seller
    @modify_sellers = verifRight('modify_sellers')
    if @modify_sellers
      @field_seller_seller = FieldsSellerSeller.where(fields_seller_id: params[:field_seller_id], seller_id: params[:id])
      if @field_seller_seller.update_all(content: params[:content])
        respond_to { |format| format.json { head :no_content } }
      else
        respond_to { |format| format.json { render json: @field_seller_seller.errors, status: :unprocessable_entity } }
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /sellers/1/delete_field_seller
  def delete_field_seller
    @modify_sellers = verifRight('modify_sellers')
    if @modify_sellers
      @field_seller_seller = FieldsSellerSeller.where(fields_seller_id: params[:field_seller_id], seller_id: params[:id])
      if @field_seller_seller.delete_all
        respond_to { |format| format.json { head :no_content } }
      else
        respond_to { |format| format.json { render json: @field_seller_seller.errors, status: :unprocessable_entity } }
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_seller
    @seller = Seller.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def seller_params
    params[:seller].permit(:id, :name, :actif)
  end
end
