class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy, :reply, :download]
  before_action :set_categories_all, only: [:index, :show, :edit, :new, :create]
  before_action :set_users_all, only: [:create, :cloture_it]
  before_action :set_incidents_all, only: [:index]

  def index
  end

  def incidents_without_tech
    @incidents = Incident.where(incident_state_id_for_user: 1)
  end

  def show
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    @incidentnew = Incident.new
    return if @incident.incident_state_id_for_user == 2 &&
              @incident.tech_id == current_user.id
    @incident.update(incident_state_id_for_user: 3)
    @incident.update(incident_state_id_for_tech: 3)
    @response = Response.new(
      content: "Incident lu par le technicien
      #{current_user.name} #{current_user.surname}", incident_id: @incident.id,
      sender_id: @incident.user_id)
    @response.save!
  end

  def new
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    @incident = Incident.new
  end

  def edit
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
  end

  def update_subcats
    @sous_categories = SousCategory.where('category_id = ?',
                                          params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    @incident = Incident.new(incident_params)
    @incident.user_id ||= current_user.id
    @incident.ip_adress ||= request.remote_ip
    @incident.incident_state_id_for_user = 1
    @incident.incident_state_id_for_tech = 1
    @incident.lvl_urgence_tech = 1

    respond_to do |format|
      if @incident.save
        unless params[:tempfile].nil?
          params[:file_incidents]['tempfile'].each do |a|
            @file_incident = @incident.file_incidents.create!(
              incident_id: @incident.id,
              file: a
            )
          end
        end
        @response = Response.new(
          content: "Incident créé par #{current_user.name}
          #{current_user.surname}", incident_id: @incident.id,
          sender_id: @incident.user_id)
        @response.save
        format.html { redirect_to edit_incident_path(@incident) }
        format.json { render :show, status: :created, location: @incident }
        AppMailer.incident_created_for_creator(@incident, @users).deliver_now
        AppMailer.incident_created_for_disp(@incident, @users).deliver_now
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to_back }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url }
      format.json { head :no_content }
    end
  end

  def download
    send_file "#{Rails.root}/public/uploads/incidents/#{@incident.file_incidents.id}/#{@incident.file_incidents.identifier}"
  end

  private

  def set_categories_all
    @categories = Category.all
  end

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def set_users_all
    @users = User.all
  end

  def set_incidents_all
    @incidents = Incident.all
  end

  def incident_params
    params.require(:incident).permit(
      :content, :title, :user_id, :tech_id,
      :category_id, :sous_category_id, :lvl_urgence_user,
      :lvl_urgence_tech, file_incidents_attributes: [:id, :incident_id, :file, :content_type, :file_size])
  end
end
