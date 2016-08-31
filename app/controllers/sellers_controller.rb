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

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    @view_sellers = verifRight('view_sellers')
    if @view_sellers
      @title = "Vendeur n° : #{@seller.id}"
      respond_to do |format|
        format.json { render json: @seller }
        format.html { render :show }
      end
    else
      renderUnauthorized
    end
  end

  # GET /sellers/new
  def new
    @create_sellers = verifRight('create_sellers')
    if @create_sellers
      @title = 'Nouveau vendeur'
      @seller = Seller.new
    else
      renderUnauthorized
    end
  end

  # GET /sellers/1/edit
  def edit
    @modify_seller = verifRight('modify_seller')
    if @modify_seller
      @title = "Editer vendeur n° #{@seller.id}"
    else
      renderUnauthorized
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
    @modify_seller = verifRight('modify_seller')
    if @modify_seller
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
      respond_to do |format|
        if @seller.destroy
          format.json { head :no_content }
          format.html { redirect_to sellers_url, notice: 'Le vendeur a bien été supprimé ! Il ne vendra plus jamais quoi que ce soit... Mouahahahahahaha !!!' }
        else
          format.json { render json: @seller.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de supprimer le vendeur.' }
        end
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
    params[:seller]
  end
end
