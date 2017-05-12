# field_agency_agency.rb
class FieldAgencyAgency < ActiveRecord::Base
  belongs_to :field_agency, dependent: :destroy
  belongs_to :agency, dependent: :destroy
end
