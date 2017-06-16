# field_agency_agency.rb
class FieldAgencyAgency < ActiveRecord::Base
  belongs_to :field_agency
  belongs_to :agency
end
