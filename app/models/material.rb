class Material < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :seller
  belongs_to :detentor_type

  has_many :spec_material_materials, dependent: :destroy
  has_many :spec_materials, through: :spec_material_materials

  validates :name, presence: true, length: { in: 0..254 }
end
