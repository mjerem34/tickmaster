# reject_incident.rb
class RejectIncident
  attr_accessor :status, :result
  def initialize(incident:, current_user:, ip_address:)
    @incident = incident
    @current_user = current_user
    @ip_address = ip_address
    @status = 422
    @result = "Impossible de rejeter l'incident"
  end

  def call
    reject
    self
  end

  private

  def reject
    @incident.update(incident_state_id_for_user_id: 10,
                     incident_state_id_for_tech_id: 10)
    create_response
  end

  def create_response
    response = @incident.responses.create!(
      content: @incident.incident_state_id_for_tech.name,
      sender_id: @current_user.id,
      ip_address_sender: @ip_address
    )
    archive if response.persisted?
  end

  def archive
    @incident.responses.each do |response|
      transfert response
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
