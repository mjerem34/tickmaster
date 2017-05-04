class FieldSellersController < ApplicationController
  before_action :set_field_seller, only: %i[update destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /field_sellers
  # GET /field_sellers.json
  # Should render all the fields sellers.
  def index
    @index_field_sellers = verify_right('index_field_sellers')
    if @index_field_sellers
      @title = 'Champs des vendeurs'
      @field_sellers = FieldSeller.all
      @create_field_sellers = verify_right('create_field_sellers')
      respond_to do |format|
        format.json { render json: @field_sellers }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # POST /field_sellers.json
  def create
    @create_field_sellers = verify_right('create_field_sellers')
    if @create_field_sellers
      @field_seller = FieldSeller.new(field_seller_params)
      respond_to do |format|
        if @field_seller.save
          format.js
          format.json { render json: @field_seller.id, status: :created }
        else
          format.json { render json: @field_seller.errors.full_messages.first, status: 422 }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /field_sellers/1.json
  def update
    @update_field_sellers = verify_right('update_field_sellers')
    if @update_field_sellers
      respond_to do |format|
        if @field_seller.update(field_seller_params)
          format.js
          format.json { head :no_content }
        else
          format.json { render json: @field_seller.errors.full_messages.first, status: 422 }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /field_sellers/1.json
  def destroy
    @destroy_field_sellers = verify_right('destroy_field_sellers')
    if @destroy_field_sellers
      respond_to do |format|
        if @field_seller.field_seller_sellers.none?
          if @field_seller.destroy
            format.js
            format.json { head :no_content }
          else
            format.json { render json: @field_seller.errors.full_messages.first, status: 422 }
          end
        else
          format.json { render json: 'Impossible de supprimer le champ car il contient des données associées', status: 422 }
        end
      end
    else
      permission_denied
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_field_seller
    @field_seller = FieldSeller.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def field_seller_params
    params.require(:field_seller).permit(:name)
  end
end
