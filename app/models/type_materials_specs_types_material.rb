class TypeMaterialsSpecsTypesMaterial < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :specs_types_material, foreign_key: :specs_types_material_id
end
