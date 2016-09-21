class SpecsMaterial < ActiveRecord::Base
  has_many :spec_material_materials
  has_many :materials, through: :spec_material_materials
  belongs_to :specs_types_materials, foreign_key: :spec_type_material_id
end
