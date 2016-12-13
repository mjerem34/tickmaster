class SpecMaterialMaterial < ActiveRecord::Base
  belongs_to :spec_material
  belongs_to :material
end
