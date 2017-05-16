class TypeMaterialSeller < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :seller

  validates_uniqueness_of :seller_id, scope: [:type_material_id]
end
