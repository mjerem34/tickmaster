class ResponsesController < ApplicationController
  before_action :set_expiration


  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])
  end

  # GET /responses/new
  def new
    @incident = Incident.find(params[:incident_id])
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @incident = Incident.find(params[:incident_id])
    @response = @incident.responses.new(response_params)
    case params[:commit]
    when 'Rejeter' then
      @response.content = 'Incident rejeté : ' + @response.content
    when 'Réaffecter' then
      @response.content = 'Demande de réaffectation envoyée : ' + @response.content
    when 'Cloturer' then
      @response.content = "Cloture de l'incident : " + @response.content
    end
    @response.sender_id = current_user.id
    @response.ip_adress_sender ||= request.remote_ip
    if @response.sender_id == @incident.tech_id
      @response.receiver_id = @incident.user_id
    else
      @response.receiver_id = @incident.tech_id
    end
    @users = User.all

    if @response.save!
      unless params[:file_responses].nil?
        params[:file_responses]['file'].each do |a|
          if a.size > 31_457_280
            flash[:notice] = 'Doit être inférieur à 30 Mo'
          elsif a.size > 5_242_880
            flash[:notice] = 'Doit être inférieur à 5 Mo'
          end
          @file_responses = @response.file_responses.create(
            response_id: @response.id,
            file: a
          )
        end
      end
      case params[:commit]
      when 'Répondre' then
        if @response.sender_id == @incident.user_id
          @incident.update(incident_state_id_for_user: 6)
          @incident.update(incident_state_id_for_tech: 4)
        elsif @response.sender_id == @incident.tech_id
          @incident.update(incident_state_id_for_user: 4)
          @incident.update(incident_state_id_for_user: 5)
        end
        if @users.where(id: @response.sender_id).pluck(:tech_id).join == '5'
          @response.receiver_id.nil? ? nil : AppMailer.incident_replied_for_tech_if_disp_answered(@incident, @users, @response).deliver_now
          AppMailer.incident_replied_for_creator_if_disp_answered(@incident, @users, @response).deliver_now
          AppMailer.incident_replied_for_disp_if_disp_answered(@incident, @users, @response).deliver_now
        else
          AppMailer.incident_replied_for_sender(@incident, @users, @response).deliver_now
          @response.receiver_id.nil? ? nil : AppMailer.incident_replied_for_receiver(@incident, @users, @response).deliver_now
          AppMailer.incident_replied_for_disp(@incident, @users, @response).deliver_now
        end
        flash[:notice] = "Votre message a bien été envoyé."
        redirect_to edit_incident_path(@incident)
      when 'Rejeter' then
        reject_it(@incident)
        AppMailer.incident_rejected_for_creator(@incident, @users).deliver_now
        AppMailer.incident_rejected_for_disp(@incident, @users).deliver_now
        flash[:notice] = "Votre demande de rejet a bien été prise en compte."
        redirect_to edit_incident_path(@incident)
      when 'Réaffecter' then
        reaffect_it(@incident)
        AppMailer.incident_reaffected_for_tech(@incident, @users).deliver_now
        AppMailer.incident_reaffected_for_disp(@incident, @users).deliver_now
        flash[:notice] = "Votre demande de réaffectation a bien été prise en compte."
        redirect_to edit_incident_path(@incident)
      when 'Cloturer' then
        cloture_it(@incident)
      end
    else
      redirect_to edit_incident_path(@incident)
      end
    end
  end

# PATCH/PUT /responses/1
# PATCH/PUT /responses/1.json
def update
  respond_to do |format|
    if @response.update(response_params)
      format.html { redirect_to @response }
      format.json { render :show, status: :ok, location: @response }
    else
      format.html { render :edit }
      format.json { render json: @response.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /responses/1
# DELETE /responses/1.json

def destroy
  @response.destroy
  respond_to do |format|
    format.html { redirect_to responses_url }
    format.json { head :no_content }
  end
end

def download
  send_file "#{Rails.root}/public/uploads/responses/#{@response.file_responses.id}/#{@response.file_responses.identifier}"
end

  private

  def set_expiration
    expires_in(100.years, public: true)
  end
# Never trust parameters from the scary internet, only allow the white list through.
def response_params
  params.require(:response).permit(:content, file_responses_attributes: [:id, :response_id, :file, :content_type, :file_size])
end
