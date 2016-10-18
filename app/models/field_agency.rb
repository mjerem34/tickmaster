class FieldAgency < ActiveRecord::Base
  has_many :field_agency_agencies, foreign_key: :field_agency_id
  has_many :agencies, through: :field_agency_agencies
end
