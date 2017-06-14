# sellers_controller.rb
class SellersController < ApplicationController
  before_action :set_seller,
                only: %i[update destroy show]

  before_action :restrict_access
  before_action :set_type_material, only: :bind_type_material
  before_action :set_field_seller_seller, only: %i[unbind_field_seller
                                                   update_field_seller]
  before_action :set_field_seller, only: :bind_field_seller
  before_action :materials_binded?, only: :destroy
  # GET /sellers.json
  def index
    @field_sellers = FieldSeller.all
    @type_materials = TypeMaterial.all
    @sellers = Seller.all
    respond_to do |format|
      format.json { render json: @sellers }
      format.html { render :index }
    end
  end

  # GET /sellers/1.json
  def show
    render json: @seller
  end

  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)
    respond_to do |format|
      if @seller.save
        format.js
        format.json { render json: @seller.id, status: :created }
      else
        format.json { render json: @seller.errors.full_messages, status: 422 }
      end
    end
  end

  # PATCH/PUT /sellers/1.json
  def update
    if @seller.update(seller_params)
      render json: nil
    else
      render json: @seller.errors.full_messages, status: 422
    end
  end

  # DELETE /sellers/1.json
  # Just disable/enable the seller
  def destroy
    if @seller.destroy
      render json: nil
    else
      render json: @seller.errors.full_messages, status: 422
    end
  end

  # POST /sellers/1/bind_type_material.json
  def bind_type_material
    @type_material_seller = TypeMaterialSeller.new(
      type_material_id: @type_material.id,
      seller_id: params[:id]
    )
    if @type_material_seller.save
      render json: @type_material.id
    else
      render json: @type_material.errors.full_messages, status: 422
    end
  end

  # DELETE /sellers/1/unbind_type_material.json
  def unbind_type_material
    @type_material_seller = TypeMaterialSeller.where(
      type_material_id: params[:type_material][:id],
      seller_id: params[:id]
    )
    if @type_material_seller.delete_all
      render json: nil
    else
      render json: @type_material_seller.errors.full_messages, status: 422
    end
  end

  # POST /sellers/1/bind_field_seller.json
  def bind_field_seller
    @field_seller_seller = FieldSellerSeller.new(
      field_seller_id: @field_seller.id,
      seller_id: params[:id], content: params[:content]
    )
    if @field_seller_seller.save
      render json: @field_seller.id
    else
      render json: @field_seller.errors.full_messages, status: 422
    end
  end

  # PUT /sellers/1/update_field_seller.json
  def update_field_seller
    if @field_seller_seller.update_all(content: params[:content])
      render json: nil
    else
      render json: @field_seller_seller.errors.full_messages, status: 422
    end
  end

  # DELETE /sellers/1/unbind_field_seller.json
  def unbind_field_seller
    if @field_seller_seller.delete_all
      render json: nil
    else
      render json: @field_seller_seller.errors.full_messages, status: 422
    end
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params[:seller].permit(:id, :name, :actif)
  end

  def materials_binded?
    render json: 'Des matériels sont liés', status: 422 if @seller
                                                           .materials.any?
  end

  def set_field_seller
    @field_seller = FieldSeller.find_or_create_by(
      name: params[:field_seller][:name]
    )
  end

  def set_type_material
    @type_material = TypeMaterial
                     .find_or_create_by(name: params[:type_material][:name])
  end

  def set_field_seller_seller
    @field_seller_seller = FieldSellerSeller.where(
      field_seller_id: params[:field_seller][:id],
      seller_id: params[:id]
    )
  end
end
