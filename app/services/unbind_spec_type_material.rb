# unbind_spec_type_material.rb
class UnbindSpecTypeMaterial
  attr_accessor :result, :status

  def initialize(type_material_id, spec_type_material_id)
    @result = "N'est pas lié"
    @status = 422
    @type_material_id = type_material_id
    @spec_type_material_id = spec_type_material_id
  end

  def call
    unbind if binded?
    self
  end

  private

  def unbind
    return unless TypeMaterialSpecTypeMaterial
                  .where(spec_type_material_id: @spec_type_material_id,
                         type_material_id: @type_material_id).delete_all
    @result = 'Ok'
    @status = 200
  end

  def binded?
    TypeMaterialSpecTypeMaterial
      .where(spec_type_material_id: @spec_type_material_id,
             type_material_id: @type_material_id).any?
  end
end
