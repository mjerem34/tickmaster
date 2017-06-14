# field_sellers_controller.rb
class FieldSellersController < ApplicationController
  before_action :set_field_seller, only: %i[update destroy]

  before_action :restrict_access
  before_action :seller_binded?, only: :destroy

  # GET /field_sellers
  # GET /field_sellers.json
  # Should render all the fields sellers.
  def index
    @field_sellers = FieldSeller.all
    respond_to do |format|
      format.json { render json: @field_sellers }
      format.html { render :index }
    end
  end

  # POST /field_sellers.json
  def create
    @field_seller = FieldSeller.new(field_seller_params)
    if @field_seller.save
      render json: @field_seller.id, status: :created
    else
      render json: @field_seller.errors.full_messages, status: 422
    end
  end

  # PATCH/PUT /field_sellers/1.json
  def update
    if @field_seller.update(field_seller_params)
      render json: nil, status: 204
    else
      render json: @field_seller.errors.full_messages, status: 422
    end
  end

  # DELETE /field_sellers/1.json
  def destroy
    if @field_seller.destroy
      render json: nil, status: 204
    else
      render json: @field_seller.errors.full_messages, status: 422
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
