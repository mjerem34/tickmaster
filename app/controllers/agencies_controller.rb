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
      @delete_agency = verifRight('delete_agency')
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

  def ping
    @title = 'Ping'
    @agencies = Agency.all
  end

  # Must exec the method to do the ping and get the result to return it.
  def doPing
    if verifRight('ping_agencies')
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
        format.html { redirect_to edit_agency_url(@agency) }
      end

    else
      renderUnauthorized
    end
  end

  # GET /agencies/new
  # This should render the page for create an agency.
  def new
    @create_new_agency = verifRight('create_new_agency')
    if @create_new_agency
      @agency = Agency.new
      @title = 'Nouvelle agence'
      @field_agencies = FieldAgency.all
    else
      renderUnauthorized
    end
  end

  # GET /agencies/1/edit
  # Should get the agency and render the edit form.
  def edit
    if verifRight('edit_agency')
      @title = 'Editer agence'
      @field_agencies = FieldAgency.all
    else
      renderUnauthorized
    end
  end

  # POST /agencies
  # POST /agencies.json
  # Should create a new agency, it used for the rest service.
  def create
    if verifRight('create_new_agency')
      @agency = Agency.new(agency_params)
      respond_to do |format|
        if @agency.save
          params[:dataAgenceComp].each do |param, val|
            field_agency = FieldAgency.find_by(name: param.to_s)
            field_agency_selected = @agency.field_agency_agencies.find_or_initialize_by(agency_id: @agency.id, field_agency_id: field_agency.id)
            field_agency_selected.content = val
            field_agency_selected.save
          end
          format.js
          format.json { render json: @agency.id, status: :created }
          format.html { redirect_to @agency, notice: "Vous venez de créer une agence. Merci d'avoir contribué à la baisse du chômage." }
        else
          format.json { render json: @agency.errors.full_messages.first, status: :unprocessable_entity }
          format.html { render :new }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  # Should used for the rest service for update an agency.
  # It get an agency by his id.
  def update
    if verifRight('edit_agency')
      respond_to do |format|
        @agency.update(agency_params)
        params[:dataAgenceComp].each do |param, val|
          field_agency = FieldAgency.find_by(name: param.to_s)
          field_agency_selected = @agency.field_agency_agencies.find_or_initialize_by(agency_id: @agency.id, field_agency_id: field_agency.id)
          if field_agency_selected.content.nil? || field_agency_selected.content != val
            field_agency_selected.content = val
            field_agency_selected.save
          end
        end
        format.js
        format.json { head :no_content }
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  # Should destroy an agency by the id passed in params.
  # Maybe do a test if there are nobody in her.
  def destroy
    if verifRight('delete_agency')
      respond_to do |format|
        if User.where(agency_id: @agency.id).empty?
          if @agency.destroy
            format.json { head :no_content }
            format.html { redirect_to agencies_url, notice: "C'est vous le chef ! Et c'est vous qui décidez de qui doit vivre !" }
          else
            format.json { render json: @agency.errors, status: :unprocessable_entity }
            format.html { render :edit, notice: 'Impossible de supprimer cette agence, allez savoir pourquoi ... Peut être que les employés y sont pour quelque chose ...' }
          end
        else
          format.json { render json: 'Vous ne pouvez pas supprimer cette agence car elle contient des utilisateurs.', status: :unprocessable_entity }
          format.html { redirect_to agencies_url, alert: 'Vous ne pouvez pas supprimer cette agence car elle contient des utilisateurs.' }
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
    params[:agency].permit(:name, :ip_adress)
  end
end
