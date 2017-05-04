# sellers_controller.rb
class SellersController < ApplicationController
  before_action :set_seller, only: %i[permanent_deletion add_type_material delete_type_material add_field_seller delete_field_seller update destroy show]
  before_action :set_expiration
  before_action :restrict_access

  # GET /sellers.json
  def index
    @view_sellers = verify_right('view_sellers')
    if @view_sellers
      @title = 'Vendeurs'
      @sellers = Seller.all
      @field_sellers = FieldSeller.all
      @type_materials = TypeMaterial.all
      respond_to do |format|
        format.json { render json: @sellers }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # GET /sellers/1.json
  def show
    respond_to do |format|
      format.json { render json: @seller, status: :ok }
    end
  end

  # POST /sellers.json
  def create
    @create_sellers = verify_right('create_sellers')
    if @create_sellers
      @field_sellers = FieldSeller.all
      @type_materials = TypeMaterial.all
      @seller = Seller.new(seller_params)
      respond_to do |format|
        if @seller.save
          format.js
          format.json { render json: @seller.id, status: :created }
        else
          format.json { render json: @seller.errors.full_messages.first, status: 422 }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /sellers/1.json
  def update
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      respond_to do |format|
        if @seller.update(seller_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @seller.errors.full_messages.first, status: 422 }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /sellers/1.json
  # Just disable/enable the seller
  def destroy
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      respond_to do |format|
        if @seller.actif
          @seller.update(actif: false)
          format.json { head :no_content }
        else
          @seller.update(actif: true)
          format.json { head :no_content }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /sellers/1/permanent_deletion
  def permanent_deletion
    @delete_sellers = verify_right('delete_sellers')
    if @delete_sellers
      respond_to do |format|
        if @seller.materials.any?
          format.json { render json: 'Impossible de supprimer ce vendeur car il contient des données associées', status: 422 }
        else
          if @seller.destroy
            FieldSellerSeller.where(seller_id: @seller.id).delete_all
            TypeMaterialSeller.where(seller_id: @seller.id).delete_all
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @seller.errors.full_messages.first, status: 422 }
          end
        end
      end
    else
      permission_denied
    end
  end

  # TODO : Créer un controller type_material_seller et mettre ça
  # POST /sellers/1/add_type_material.json
  def add_type_material
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      @type_material = TypeMaterial.find_or_create_by(name: params[:type_material][:name])
      respond_to do |format|
        if TypeMaterialSeller.exists?(type_material_id: @type_material.id, seller_id: params[:id])
          format.json { render json: 'Ce type de matériel a déjà été ajouté a ce vendeur', status: 422 }
        else
          if TypeMaterialSeller.create(type_material_id: @type_material.id, seller_id: params[:id])
            format.js
            format.json { render json: @type_material.id, status: :ok }
          else
            format.json { render json: @type_material.errors.full_messages.first, status: 422 }
          end
        end
      end
    else
      permission_denied
    end
  end

  # TODO : Et ça aussi !
  # DELETE /sellers/1/delete_type_material.json
  def delete_type_material
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      respond_to do |format|
        @type_material_id = params[:type_material][:id]
        @type_material_seller = TypeMaterialSeller.where(type_material_id: params[:type_material][:id], seller_id: params[:id])
        if @type_material_seller.nil?
          format.json { render json: 'Impossible de supprimer ce qui n\'existe pas...', status: 404 }
        else
          if @type_material_seller.delete_all
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @seller.errors.full_messages.first, status: 422 }
          end
        end
      end
    else
      permission_denied
    end
  end

  # TODO : Créer un controller field_seller_seller et mettre ça :
  # POST /sellers/1/add_field_seller.json
  def add_field_seller
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      @field_seller = FieldSeller.find_or_create_by(name: params[:field_seller][:name])
      respond_to do |format|
        if FieldSellerSeller.exists?(field_seller_id: @field_seller.id, seller_id: params[:id])
          format.json { render json: 'Ce champ existe déjà.', status: 422 }
        else
          @field_seller_seller = FieldSellerSeller.new(field_seller_id: @field_seller.id, seller_id: params[:id], content: params[:content])
          if @field_seller_seller.save
            format.js
            format.json { render json: @field_seller.id, status: :created }
          else
            format.json { render json: @field_seller.errors.full_messages.first, status: 422 }
          end
        end
      end
    else
      permission_denied
    end
  end

  # TODO : Ca aussi
  # PUT /sellers/1/update_field_seller.json
  def update_field_seller
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      @field_seller_seller = FieldSellerSeller.where(field_seller_id: params[:field_seller][:id], seller_id: params[:id])
      respond_to do |format|
        if @field_seller_seller.update_all(content: params[:content])
          format.js { render 'update' }
          format.json { head :no_content }
        else
          format.json { render json: @field_seller_seller.errors.full_messages.first, status: 422 }
        end
      end
    else
      permission_denied
    end
  end
# TODO: Ca aussi :
  # DELETE /sellers/1/delete_field_seller.json
  def delete_field_seller
    @modify_sellers = verify_right('modify_sellers')
    if @modify_sellers
      @field_seller_id = params[:field_seller][:id]
      @field_seller_seller = FieldSellerSeller.where(field_seller_id: params[:field_seller][:id], seller_id: params[:id])
      respond_to do |format|
        if @field_seller_seller.delete_all
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @field_seller_seller.errors.full_messages.first, status: 422 }
        end
      end
    else
      permission_denied
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
