class SpecMaterialMaterial < ActiveRecord::Base
  belongs_to :SpecsMaterial
  belongs_to :Material
end
