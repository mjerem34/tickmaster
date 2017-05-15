# spec_type_material.rb
class SpecTypeMaterial < ActiveRecord::Base
  has_many :type_material_spec_type_materials, dependent: :destroy
  has_many :type_materials, through: :type_material_spec_type_materials
  has_many :spec_materials

  validates :name, presence: true, uniqueness: { case_sensitive: false },
                   length: { in: 0..254 }
end
