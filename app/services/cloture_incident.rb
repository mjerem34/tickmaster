# cloture_incident.rb
class ClotureIncident
  attr_accessor :status, :result
  def initialize(incident:, current_user:, ip_address:)
    @incident = incident
    @current_user = current_user
    @ip_address = ip_address
    @status = 422
    @result = "Impossible de cloturer l'incident"
  end

  def call
    cloture
    self
  end

  private

  def cloture
    if @current_user == @incident.user
      @incident.update(incident_state_id_for_user_id: 7,
                       incident_state_id_for_tech_id: 7)
    elsif @current_user == @incident.tech
      @incident.update(incident_state_id_for_user_id: 8,
                       incident_state_id_for_tech_id: 9)
    else
      return false
    end
    create_response
  end

  def create_response
    @cloture_response = @incident.responses.create!(
      content: @incident.incident_state_id_for_tech.name,
      sender_id: @current_user.id,
      ip_address_sender: @ip_address
    )
    archive
  end

  def archive
    if @cloture_response.persisted? && @current_user == @incident.user
      @incident.responses.each do |response|
        transfert response
      end
    end
    alert
  end

  def transfert(response)
    ActiveRecord::Base.transaction do
      Archive.create!(
        content: response.content,
        incident_id: response.incident_id,
        sender_id: response.sender_id,
        ip_address_sender: response.ip_address_sender
      )
      response.destroy!
    end
  end

  def alert
    @status = 200
    @result = 'Incident cloturé'
  end
end
