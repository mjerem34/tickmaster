# field_sellers_controller.rb
class FieldSellersController < ApplicationController
  before_action :set_field_seller, only: %i[update destroy]
  before_action :set_expiration
  before_action :restrict_access
  before_action :seller_binded?, only: :destroy

  # GET /field_sellers
  # GET /field_sellers.json
  # Should render all the fields sellers.
  def index
    @field_sellers = FieldSeller.all
    verify_right('create_field_sellers')
    respond_to do |format|
      format.json { render json: @field_sellers }
      format.html { render :index }
    end
  end

  # POST /field_sellers.json
  def create
    @field_seller = FieldSeller.new(field_seller_params)
    respond_to do |format|
      if @field_seller.save
        format.js
        format.json { render json: @field_seller.id, status: :created }
      else
        format.json { render json: @field_seller.errors.full_messages, status: 422 }
      end
    end
  end

  # PATCH/PUT /field_sellers/1.json
  def update
    respond_to do |format|
      if @field_seller.update(field_seller_params)
        format.js
        format.json { head :no_content }
      else
        format.json { render json: @field_seller.errors.full_messages, status: 422 }
      end
    end
  end

  # DELETE /field_sellers/1.json
  def destroy
    respond_to do |format|
      if @field_seller.destroy
        format.js
        format.json { head :no_content }
      else
        format.json { render json: @field_seller.errors.full_messages, status: 422 }
      end
    end
  end

  private

  def seller_binded?
    render json: 'Un vendeur est lié', status: 422 if @field_seller
                                                      .field_seller_sellers
                                                      .exists?
  end

  def set_field_seller
    @field_seller = FieldSeller.find(params[:id])
  end

  def field_seller_params
    params.require(:field_seller).permit(:name)
  end
end
