# append_spec_type_material.rb
class AppendSpecTypeMaterial
  attr_accessor :result, :status

  def initialize(id, name)
    @result = 'Déjà lié'
    @status = 422
    @name = name
    @id = id
  end

  def call
    unless binded?
      TypeMaterialSpecTypeMaterial
        .create(spec_type_material_id: spec_type_material.id,
                type_material_id: type_material.id)
      @result = spec_type_material.id
      @status = 200
    end
    self
  end

  private

  def spec_type_material
    @spec_type_material ||= SpecTypeMaterial.find_or_create_by(name: @name)
  end

  def type_material
    @type_material ||= TypeMaterial.find(@id)
  end

  def binded?
    TypeMaterialSpecTypeMaterial
      .where(spec_type_material_id: spec_type_material.id,
             type_material_id: type_material.id).any?
  end
end
