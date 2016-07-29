class SpecsTypesMaterial < ActiveRecord::Base
  has_many :TypesMaterialsSpecMaterials
  has_many :TypeMaterials, through: :TypesMaterialsSpecMaterials
end
