# update_agency.rb
class UpdateAgency
  def initialize(params:)
    @id = params[:id]
    @name = params[:agency][:name]
    @ip_adress = params[:agency][:ip_adress]
    @data_agence_comp = params[:agency][:data_agence_comp]
  end

  def update
    set_agency.tap do |agency|
      update_fields_of(agency) if update_agency
    end
  end

  private

  def set_agency
    @agency = Agency.find(@id)
  end

  def update_fields_of(agency)
    @data_agence_comp.each do |name, val|
      if field_agency_selected(agency, name).content.nil? || field_agency_selected(agency, name).content != val
        field_agency_selected.content = val
        field_agency_selected.save
      end
    end
  end

  def update_agency
    @agency.update(name: @name, ip_adress: @ip_adress)
  end

  def field_agency(name)
    FieldAgency.find_or_create_by(name: name)
  end

  def field_agency_selected(agency, name)
    agency
      .field_agency_agencies
      .find_or_initialize_by(agency_id: agency.id,
                             field_agency_id: field_agency(name).id)
  end
end
