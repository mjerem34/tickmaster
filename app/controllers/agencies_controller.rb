# Defines the agencies, ping, delete, create, show and delete them.
class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /agencies
  # GET /agencies.json
  # Must render all the agencies if they have the authorization.
  def index
    @view_index_agencies = verifRight('view_index_agencies')
    if @view_index_agencies
      @ping_agencies = verifRight('ping_agencies')
      @edit_agency = verifRight('edit_agency')
      @title = 'Agences'
      @agencies = Agency.order('name asc')
      respond_to do |format|
        format.json { render json: @agencies }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # Must exec the method to do the ping and get the result to return it.
  def doPing
    if verifRight('doPing')
      # Execution of the method for ping with the ip passed
      value = pingDef(params[:host])
      render json: value
    else
      renderUnauthorized
    end
  end

  # Must exec the ping with the gem net-ping.
  def pingDef(host)
    if host != 'NULL'
      @icmp = Net::Ping::ICMP.new(host)
      if @icmp.ping
        value = @icmp.duration
        value = (value * 1000).round(1)
        return value
      else
        return 0
      end
    end
    0
  end

  # GET /agencies/1
  # GET /agencies/1.json
  # Must render one agency.
  def show
    if verifRight('view_agency_details')
      @title = "Incidents de l'agence : " + @agency.name
      respond_to do |format|
        format.json { render json: @agency }
        format.html { render :show }
      end

    else
      renderUnauthorized
    end
  end

  # GET /agencies/new
  def new
    @create_new_agency = verifRight('create_new_agency')
    if @create_new_agency
      @agency = Agency.new
      @title = 'Nouvelle agence'
    else
      renderUnauthorized
    end
  end

  # GET /agencies/1/edit
  def edit
    if verifRight('edit_agency')
      @title = 'Editer agence'
    else
      renderUnauthorized
    end
  end

  # POST /agencies
  # POST /agencies.json
  def create
    if verifRight('create_new_agency')
      @title = 'Nouvelle agence'
      @agency = Agency.new(agency_params)
      respond_to do |format|
        if @agency.save
          format.json { render :show, status: :created, location: @agency }
          format.html { redirect_to @agency, notice: "Vous venez de créer une agence. Merci d'avoir contribué à la baisse du chômage." }
        else
          format.json { render json: @agency.errors, status: :unprocessable_entity }
          format.html { render :new }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    if verifRight('edit_agency')
      respond_to do |format|
        if @agency.update(agency_params)
          format.json { render :show, status: :ok, location: @agency }
          format.html { redirect_to @agency, notice: 'Les paramètres de cette agence ont bien été actualisés.' }
        else
          format.json { render json: @agency.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier cette agence ...' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    if verifRight('delete_agency')
      respond_to do |format|
        if @agency.destroy
          format.json { head :no_content }
          format.html { redirect_to agencies_url, notice: "Vous venez d'arracher plusieurs vies innocentes en supprimant cette agence ..." }
        else
          format.json { render json: @agency.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de supprimer cette agence, allez savoir pourquoi ...' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_agency
    @agency = Agency.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def agency_params
    params[:agency].permit(:name, :adress, :adress2, :adress3, :cp, :city, :email, :tel, :fax, :department, :ip_adress)
  end
end
