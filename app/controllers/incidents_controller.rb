# incidents_controller.rb
class IncidentsController < ApplicationController
  before_action :set_incident, only: %i[show edit update destroy reply download]
  before_action :set_categories_all, only: %i[index show edit new create]
  before_action :set_users_all, only: %i[create index without_tech]
  before_action :set_expiration
  before_action :restrict_access
  before_action { verify_right("#{action_name}_#{controller_name}") }

  # GET /incidents
  # GET /incidents.json
  # Should render all the incidents.
  # @techs var is for dispatch the incidents with json and ajax.
  def index
    @index_incidents = verify_right('index_incidents')
    if @index_incidents
      @title = 'Liste de tous les incidents'
      @techs = @users.joins(:type_user).where('type_users.is_tech = true').collect { |p| [[p.surname, p.name].join(' '), p.id] }
      @incidents = Incident.includes(:user, :category, :sous_category).order('created_at desc')
      respond_to do |format|
        format.json { render json: @incidents }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # GET /incidents/1/without_tech
  # GET /incidents/1/without_tech.json
  # Should render all the incidents that does not have a tech.
  # @techs var is for dispatch the incidents with json and ajax.
  def without_tech
    @without_tech_incidents = verify_right('without_tech_incidents')
    if @without_tech_incidents
      @title = 'Incidents non attribués'
      @techs = @users.joins(:type_user).where('type_users.is_tech = true').collect { |p| [[p.surname, p.name].join(' '), p.id] }
      @incidents = Incident.where(tech_id: nil).where.not(incident_state_id_for_tech: [7, 10]).includes(:user, :category, :sous_category).order('created_at desc')
      respond_to do |format|
        format.json { render json: @incidents }
        format.html { render :without_tech }
      end
    else
      permission_denied
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  # Should render only the incident selected (with the id passed in params).
  def show
    respond_to do |format|
      format.json { render json: @incident }
      format.html { redirect_to :edit_incident }
    end
  end

  # GET /incidents/new
  # Should render the new form for create an incident.
  # @sous_categories should be use for the list and it reloaded when
  # the user select an another category (see the update_subcats mthd).
  def new
    @new_incidents = verify_right('new_incidents')
    if @new_incidents
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      @incident = Incident.new
      @title = 'Créer un incident'
    else
      permission_denied
    end
  end

  # GET /incidents/1/edit
  # Should render the edit form, this is the default view for any incident
  # Nobody can edit an incident except the field 'technician'.
  def edit
    @view_detail_incident = verify_right('view_detail_incident')
    if @view_detail_incident
      @create_procedure = verify_right('create_procedure')
      @cloture_incidents = verify_right('cloture_incidents')
      @reject_incidents = verify_right('reject_incidents')
      @ask_for_reaffect = verify_right('ask_for_reaffect')
      @edit_incidents = verify_right('edit_incidents')
      @edit_categories_incidents = verify_right('edit_categories_incidents')
      @edit_lvl_incident = verify_right('edit_lvl_incident')
      @without_tech_incidents = verify_right('without_tech_incidents')
      @save_changes_of_edit = verify_right('save_changes_of_edit')
      @response = Response.new
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      @title = "Incident n°#{@incident.id} de #{@incident.user.name} #{@incident.user.surname}"
    else
      permission_denied
    end
  end

  # This is the method for update the list of the subcatecories when
  # We want to create an incident.
  # It do the job in ajax, when the user change the category selected.
  def update_subcats
    @sous_categories = SousCategory.where('category_id = ?',
                                          params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  # Should dispatch the incident passed in params to the tech passed in params.
  # Do the job in ajax, it send a notif.
  def send_tech_form
    @without_tech_incidents = verify_right('without_tech_incidents')
    if @without_tech_incidents
      @incident = Incident.find(params[:incident_id])
      @incident.update(tech_id: params[:tech_id])
      unless @incident.tech.ip_addr.blank?
        begin
          sendNotif(@incident.tech.ip_addr, "L'incident n°" + @incident.id.to_s + ' vient de vous être affecté !')
        rescue
          nil
        end
      end
      respond_to do |format|
        format.js
      end
    else
      permission_denied
    end
  end

  # POST /incidents
  # POST /incidents.json
  # Should create an incident
  def create
    @new_incidents = verify_right('new_incidents')
    if @new_incidents
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      @incident = Incident.new(incident_params)
      @incident.user_id ||= current_user.id
      # Set the ip address from where are created the incident.
      @incident.ip_address ||= request.remote_ip
      respond_to do |format|
        if @incident.save
          # If the incident is save, and if it contains files, it save files.
          unless params[:file_incidents].nil?
            params[:file_incidents]['file'].each do |a|
              @file_incident = @incident.file_incidents.create!(
                incident_id: @incident.id,
                file: a
              )
            end
          end
          # It create a new answer to follow the progression of the incident.
          @response = Response.new(
            content: "Incident créé par #{current_user.name}
            #{current_user.surname}", incident_id: @incident.id,
            sender_id: @incident.user_id
          )
          @response.save
          format.json { render :show, status: :created, location: @incident }
          format.html { redirect_to edit_incident_path(@incident), notice: 'Votre incident a bien été créé.' }
          begin
            # Send an validation email to the creator.
            AppMailer.incident_created_for_creator(@incident, @users).deliver_now
          rescue
            nil
          end
          begin
            # Send an email to the dispatchor.
            AppMailer.incident_created_for_disp(@incident, @users).deliver_now
          rescue
            nil
          end
          User.joins(:type_user).where('type_users.is_tech=1').each do |disp|
            next if disp.ip_addr.blank?
            sendNotif(disp.ip_addr, @incident.user.name + ' ' + @incident.user.surname + ' a créé un incident !')
          end
        else
          format.json { render json: "Impossible de créer l'incident", status: 422 }
          format.html { render :new, notice: "Impossible de créer l'incident, veuillez réessayer" }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  # Should update the params of the incident selected (with the id passed in params).
  # But this mthd is useless because nobody can edit an incident.
  # Even God...
  # And even Chuck Norris.
  def update
    @edit_incidents = verify_right('edit_incidents')
    if @edit_incidents
      respond_to do |format|
        if @incident.update(incident_params)
          format.json { head :no_content }
          format.html { redirect_to :back, notice: "L'incident a bien été mis à jour." }
        else
          format.html { redirect_to :back }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  # Could not delete an incident.
  # Could only reject, cloture or reaffect it.
  # It depends on the value of params[:commit].
  # The incident is determined by the params[:id].
  def destroy
    @delete_incident = verify_right('delete_incident')
    if @delete_incident
      traitResponse(params[:commit], params[:id])
    else
      permission_denied
    end
  end

  def reject
    # TODO : Integrate !
  end

  def cloture
    # TODO : Integrate !
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

  def incident_params
    params.require(:incident).permit(
      :content, :title, :user_id, :tech_id,
      :category_id, :sous_category_id, :lvl_urgence_user,
      :lvl_urgence_tech, file_incidents_attributes: %i[id incident_id file content_type file_size]
    )
  end
end
