class SpecsTypesMaterial < ActiveRecord::Base
  has_many :type_materials_specs_types_materials, dependent: :destroy
  has_many :type_materials, through: :type_materials_specs_types_materials
  has_many :specs_materials, foreign_key: :specs_types_material_id
end
