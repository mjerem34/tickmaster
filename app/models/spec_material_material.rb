class SpecMaterialMaterial < ActiveRecord::Base
  belongs_to :specs_material
  belongs_to :material
end
