class SpecMaterial < ActiveRecord::Base
  has_many :spec_material_materials
  has_many :materials, through: :spec_material_materials
  belongs_to :spec_type_material

  validates :spec_type_material_id, presence: true
  validates :spec_value, presence: true, uniqueness: { case_sensitive: false }, length: { in: 0..254 }
end
