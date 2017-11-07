# create_incident.rb
class CreateIncident
  def initialize(params:)
    @params = params
    @incident = Incident.new(@params)
  end

  def call
    notify_all if create
    @incident
  end

  private

  def default_response_creation
    Response.create!(
      content: "Incident créé par #{@incident.user.name}
      #{@incident.user.surname}", incident_id: @incident.id,
      sender_id: @incident.user_id, ip_address_sender: '0.0.0.0'
    )
  end

  def create
    @incident.save!
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
    AppMailer.incident_created_for_creator(@incident, User.all).deliver_now
    AppMailer.incident_created_for_disp(@incident, User.all).deliver_now
  end

  def notify_all
    default_response_creation
    send_emails
  end
end
