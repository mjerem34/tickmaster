class MaterialsDetentor < ActiveRecord::Base
  belongs_to :detentor_type
  belongs_to :material
end
