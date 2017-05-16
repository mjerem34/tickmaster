# create_spec_material.rb
class CreateSpecMaterial
  attr_accessor :result, :status

  def initialize(spec_type_material_name:, spec_value:)
    @spec_type_material_name = spec_type_material_name
    @spec_value = spec_value
    @result = 'Erreur lors de la création'
    @status = 422
  end

  def call
    if spec_material.save
      @result = @spec_material.id
      @status = 201
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
      @spec_material = SpecMaterial.new(
        spec_type_material_id: spec_type_material.id, spec_value: @spec_value
      )
    end
  end
end
