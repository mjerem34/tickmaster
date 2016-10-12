class SpecMaterialMaterial < ActiveRecord::Base
  belongs_to :specs_material, foreign_key: :spec_material_id
  belongs_to :material
end
