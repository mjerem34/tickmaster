class SpecsMaterial < ActiveRecord::Base
  has_many :SpecMaterialMaterials
  has_many :Materials, through: :SpecMaterialMaterials
  belongs_to :specs_types_materials, foreign_key: :spec_type_material_id
end
