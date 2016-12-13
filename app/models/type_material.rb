class TypeMaterial < ActiveRecord::Base
  has_many :type_materials_specs_types_materials
  has_many :specs_types_materials, through: :type_materials_specs_types_materials
  has_many :types_materials_sellers
  has_many :sellers, through: :types_materials_sellers
  has_many :materials
end
