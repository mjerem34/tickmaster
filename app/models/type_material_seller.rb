class TypeMaterialSeller < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :seller
end
