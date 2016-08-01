class FieldsSellersController < ApplicationController
  before_action :set_fields_seller, only: [:show, :edit, :update, :destroy]

  # GET /fields_sellers
  # GET /fields_sellers.json
  def index
    @fields_sellers = FieldsSeller.all
  end

  # GET /fields_sellers/1
  # GET /fields_sellers/1.json
  def show
  end

  # GET /fields_sellers/new
  def new
    @fields_seller = FieldsSeller.new
  end

  # GET /fields_sellers/1/edit
  def edit
  end

  # POST /fields_sellers
  # POST /fields_sellers.json
  def create
    @fields_seller = FieldsSeller.new(fields_seller_params)

    respond_to do |format|
      if @fields_seller.save
        format.html { redirect_to @fields_seller, notice: 'Fields seller was successfully created.' }
        format.json { render :show, status: :created, location: @fields_seller }
      else
        format.html { render :new }
        format.json { render json: @fields_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields_sellers/1
  # PATCH/PUT /fields_sellers/1.json
  def update
    respond_to do |format|
      if @fields_seller.update(fields_seller_params)
        format.html { redirect_to @fields_seller, notice: 'Fields seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @fields_seller }
      else
        format.html { render :edit }
        format.json { render json: @fields_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields_sellers/1
  # DELETE /fields_sellers/1.json
  def destroy
    @fields_seller.destroy
    respond_to do |format|
      format.html { redirect_to fields_sellers_url, notice: 'Fields seller was successfully destroyed.' }
      format.json { head :no_content }
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
