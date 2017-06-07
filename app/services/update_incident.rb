# update_incidents.rb
class UpdateIncident
  attr_accessor :incident, :status, :result
  def initialize(params:, incident:)
    @params = params
    @incident = incident
    @status = 422
    @result = 'Changements effectués'
  end

  def call
    checks
    @status = 200 if @incident.update(@params)
    self
  end

  private

  def checks
    reaffected?
  end

  def reaffected?
    return unless @params[:tech_id].nil? &&
                  @params[:tech_id] != @incident.tech_id
    @params[:tech_id] = @incident.tech_id
    @result = 'Impossible de changer de technicien,'\
    ' veuillez demander une réaffectation'
  end
end
