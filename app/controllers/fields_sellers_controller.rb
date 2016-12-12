class FieldsSellersController < ApplicationController
  before_action :set_fields_seller, only: [:update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /fields_sellers
  # GET /fields_sellers.json
  # Should render all the fields sellers.
  def index
    @view_fields_sellers = verifRight('view_fields_sellers')
    if @view_fields_sellers
      @title = 'Champs des vendeurs'
      @fields_sellers = FieldsSeller.all
      @create_fields_sellers = verifRight('create_fields_sellers')
      respond_to do |format|
        format.json { render json: @fields_sellers }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /fields_sellers
  # POST /fields_sellers.json
  # Should create the field seller.
  def create
    @create_fields_sellers = verifRight('create_fields_sellers')
    if @create_fields_sellers
      @fields_seller = FieldsSeller.new(fields_seller_params)
      respond_to do |format|
        if @fields_seller.save
          format.json { render json: @fields_seller.id, status: :created }
          format.html { redirect_to @fields_seller, notice: 'Le champ a bien été créé' }
        else
          format.json { render json: @fields_seller.errors, status: :unprocessable_entity }
          format.html { render :new }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /fields_sellers/1
  # PATCH/PUT /fields_sellers/1.json
  # Should update the params of the field seller.
  def update
    @modify_fields_sellers = verifRight('modify_fields_sellers')
    if @modify_fields_sellers
      respond_to do |format|
        if @fields_seller.update(fields_seller_params)
          format.json { head :no_content }
          format.html { redirect_to @fields_seller, notice: 'Le champ a bien été mis à jour' }
        else
          format.json { render json: @fields_seller.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier le champ.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /fields_sellers/1
  # DELETE /fields_sellers/1.json
  # Should delete the field seller.
  def destroy
    @delete_fields_sellers = verifRight('delete_fields_sellers')
    if @delete_fields_sellers
      respond_to do |format|
        if !@fields_seller.fields_seller_sellers.any?
          if @fields_seller.destroy
            format.json { head :no_content }
            format.html { redirect_to fields_sellers_url, notice: 'Le champ a bien été supprimé' }
          else
            format.json { render json: @fields_seller.errors, status: :unprocessable_entity }
            format.html { redirect_to @fields_seller, notice: 'Impossible de supprimer le champ.' }
          end
        else
          format.json { render json: 'Impossible de supprimer le champ car il contient des données associées', status: :unprocessable_entity }
          format.html { redirect_to fields_sellers_url, notice: 'Impossible de supprimer le champ car il contient des données associées' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fields_seller
    @fields_seller = FieldsSeller.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fields_seller_params
    params.require(:fields_seller).permit(:name)
  end
end
