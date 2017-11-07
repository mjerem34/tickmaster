# create_spec_material.rb
class UpdateSpecMaterial
  attr_accessor :result, :status

  def initialize(id:, spec_type_material_name:, spec_value:)
    @id = id
    @spec_type_material_name = spec_type_material_name
    @spec_value = spec_value
    @result = 'Erreur lors de la création'
    @status = 422
  end

  def call
    if spec_material.update(
      spec_type_material_id: spec_type_material.id,
      spec_value: @spec_value
    )
      @result = @spec_material.id
      @status = 200
    end
    self
  end

  private

  def spec_type_material
    SpecTypeMaterial
      .find_or_create_by(name: @spec_type_material_name)
  end

  def spec_material
    ActiveRecord::Base.transaction do
      @spec_material = SpecMaterial.find(@id)
    end
  end
end
