class FieldAgency < ActiveRecord::Base
  has_many :field_agency_agencies, dependent: :destroy
  has_many :agencies, through: :field_agency_agencies

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
