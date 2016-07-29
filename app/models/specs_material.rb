class SpecsMaterial < ActiveRecord::Base
  has_many :SpecMaterialMaterials
  has_many :Materials, through: :SpecMaterialMaterials
end
