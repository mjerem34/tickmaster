class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration


  # GET /agencies
  # GET /agencies.json
  def home
    @title = "Agences"
  end

  def index
    @agencies = Agency.order("name asc")
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)

    respond_to do |format|
      if @agency.save
        format.html { redirect_to @agency, notice: "Vous venez de créer une agence." }
        format.json { render :show, status: :created, location: @agency }
      else
        format.html { render :new }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if @agency.update(agency_params)
        format.html { redirect_to @agency, notice: "Les paramètres de cette agence ont bien été actualisés." }
        format.json { render :show, status: :ok, location: @agency }
      else
        format.html { render :edit }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency.destroy
    respond_to do |format|
      format.html { redirect_to agencies_url, notice: "Vous venez d'arracher plusieurs vies innocentes en supprimant cette agence ..."}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expiration
      expires_in(10.seconds, public: true)
    end

    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params[:agency].permit(:name, :adress, :adress2, :adress3, :cp, :city, :email, :tel, :fax, :department, :ip_adress)
    end
end
