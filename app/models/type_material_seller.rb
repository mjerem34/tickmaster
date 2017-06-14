class TypeMaterialSeller < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :seller

  validates_uniqueness_of :type_material_id, scope: :seller_id
end
