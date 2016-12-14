class SpecMaterial < ActiveRecord::Base
  has_many :spec_material_materials
  has_many :materials, through: :spec_material_materials
  belongs_to :spec_type_material
end
