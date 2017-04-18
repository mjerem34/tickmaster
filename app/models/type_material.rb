class TypeMaterial < ActiveRecord::Base
  has_many :type_material_spec_type_materials
  has_many :spec_type_materials, through: :type_material_spec_type_materials
  has_many :type_material_sellers
  has_many :sellers, through: :type_material_sellers
  has_many :materials

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 0..254 }
end
