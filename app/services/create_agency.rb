# create_agency.rb
class CreateAgency
  def initialize(params:)
    @name = params[:agency][:name]
    @ip_adress = params[:agency][:ip_adress]
    @data_agence_comp = params[:agency][:data_agence_comp]
  end

  def create
    create_agency.tap do |agency|
      add_fields_to(agency) if agency.persisted?
    end
  end

  private

  def create_agency
    Agency.create(name: @name, ip_adress: @ip_adress)
  end

  def add_fields_to(agency)
    fields_and_values.each do |field, value|
      agency.field_agency_agencies.create(
        field_agency: field,
        content: value
      )
    end
  end

  def fields_and_values
    @data_agence_comp.map do |name, content|
      [FieldAgency.find_or_create_by(name: name), content]
    end
  end
end
