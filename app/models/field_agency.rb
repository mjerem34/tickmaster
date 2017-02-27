class FieldAgency < ActiveRecord::Base
  has_many :field_agency_agencies
  has_many :agencies, through: :field_agency_agencies
end
