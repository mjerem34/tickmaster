class Material < ActiveRecord::Base
  belongs_to :type_material, foreign_key: :type_material_id

  has_many :spec_material_materials
  has_many :specs_materials, through: :spec_material_materials

  has_many :materials_sellers
  has_many :sellers, through: :materials_sellers
end
