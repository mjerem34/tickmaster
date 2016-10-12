class Material < ActiveRecord::Base
  belongs_to :type_material, foreign_key: :type_material_id

  has_many :spec_material_materials, dependent: :destroy
  has_many :specs_materials, through: :spec_material_materials
  belongs_to :detentor_type, foreign_key: :detentor_type_id
  belongs_to :seller, foreign_key: :seller_id
end
