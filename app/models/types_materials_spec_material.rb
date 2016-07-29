class TypesMaterialsSpecMaterial < ActiveRecord::Base
  belongs_to :TypeMaterial
  belongs_to :SpecsTypesMaterial
end
