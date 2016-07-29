class Material < ActiveRecord::Base
  has_many :SpecMaterialMaterials
  has_many :SpecsMaterials, through: :SpecMaterialMaterials
  belongs_to :DetentorType
end
