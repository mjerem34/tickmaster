# create_incident.rb
class CreateIncident
  def initialize(params:)
    @params = params[:incident]
    @incident = Incident.new(@params)
  end

  def call
    notify_all if create
    @incident
  end

  private

  def default_response_creation
    Response.create(
      content: "Incident créé par #{incident.user.name}
      #{incident.user.surname}", incident_id: @incident.id,
      sender_id: @incident.user_id
    )
  end

  def create
    ActiveRecord::Base.transaction do
      @incident.save!
      return if @params[:file_incidents].nil?
      @params[:file_incidents][:file].each do |a|
        @incident.file_incidents.create!(
          incident_id: @incident.id,
          file: a
        )
        puts a.inspect
      end
    end
  end

  def send_desktop_notification
    User.joins(:type_user).where('type_users.is_tech=1').each do |disp|
      next if disp.ip_addr.blank?
      send_notif(
        disp.ip_addr,
        @incident.user.name + ' ' + @incident.user.surname + ' a créé un incident !'
      )
    end
  end

  def send_emails
    AppMailer.incident_created_for_creator(@incident, @users).deliver_now
    AppMailer.incident_created_for_disp(@incident, @users).deliver_now
  end

  def notify_all
    default_response_creation
    send_emails
  end
end
