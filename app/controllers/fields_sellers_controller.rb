class FieldSellersController < ApplicationController
  before_action :set_field_seller, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /field_sellers
  # GET /field_sellers.json
  # Should render all the fields sellers.
  def index
    @view_field_sellers = verifRight('view_field_sellers')
    if @view_field_sellers
      @title = 'Champs des vendeurs'
      @field_sellers = FieldSeller.all
      @create_field_sellers = verifRight('create_field_sellers')
      respond_to do |format|
        format.json { render json: @field_sellers }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /field_sellers
  # POST /field_sellers.json
  # Should create the field seller.
  def create
    @create_field_sellers = verifRight('create_field_sellers')
    if @create_field_sellers
      @field_seller = FieldSeller.new(field_seller_params)
      respond_to do |format|
        if @field_seller.save
          format.json { render json: @field_seller.id, status: :created }
          format.html { redirect_to @field_seller, notice: 'Le champ a bien été créé' }
        else
          format.json { render json: @field_seller.errors, status: :unprocessable_entity }
          format.html { render :new }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /field_sellers/1
  # PATCH/PUT /field_sellers/1.json
  # Should update the params of the field seller.
  def update
    @modify_field_sellers = verifRight('modify_field_sellers')
    if @modify_field_sellers
      respond_to do |format|
        if @field_seller.update(field_seller_params)
          format.json { head :no_content }
          format.html { redirect_to @field_seller, notice: 'Le champ a bien été mis à jour' }
        else
          format.json { render json: @field_seller.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier le champ.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /field_sellers/1
  # DELETE /field_sellers/1.json
  # Should delete the field seller.
  def destroy
    @delete_field_sellers = verifRight('delete_field_sellers')
    if @delete_field_sellers
      respond_to do |format|
        if !@field_seller.field_seller_sellers.any?
          if @field_seller.destroy
            format.json { head :no_content }
            format.html { redirect_to field_sellers_url, notice: 'Le champ a bien été supprimé' }
          else
            format.json { render json: @field_seller.errors, status: :unprocessable_entity }
            format.html { redirect_to @field_seller, notice: 'Impossible de supprimer le champ.' }
          end
        else
          format.json { render json: 'Impossible de supprimer le champ car il contient des données associées', status: :unprocessable_entity }
          format.html { redirect_to field_sellers_url, notice: 'Impossible de supprimer le champ car il contient des données associées' }
        end
      end
    else
      renderUnauthorized
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
