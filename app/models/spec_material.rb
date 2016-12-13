class SpecMaterial < ActiveRecord::Base
  has_many :spec_material_materials
  has_many :materials, through: :spec_material_materials
  belongs_to :spec_type_material, foreign_key: :spec_type_material_id
end
