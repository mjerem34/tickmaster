class SpecsTypesMaterial < ActiveRecord::Base
  has_many :type_materials_specs_types_materials
  has_many :type_materials, through: :type_materials_specs_types_materials
end
