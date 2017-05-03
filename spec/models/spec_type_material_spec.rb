require 'rails_helper'
RSpec.describe SpecTypeMaterial, type: :model do
  it { expect(build(:spec_type_material)).to be_valid }

  it { expect(build(:spec_type_material, name: nil)).not_to be_valid }

  it { expect(build(:spec_type_material, name: SecureRandom.hex(127))).to be_valid }

  it { expect(build(:spec_type_material, name: SecureRandom.hex(128))).not_to be_valid }

  context 'with spec_type_material created' do
    before { @spec_type_material = create(:spec_type_material) }

    it { expect(build(:spec_type_material, name: @spec_type_material.name)).not_to be_valid }

    it 'should render the spec_materials' do
      spec_material = create(:spec_material, spec_type_material_id: @spec_type_material.id)

      expect(@spec_type_material.spec_materials).to eq [spec_material]
    end

    it 'should render the type_materials' do
      type_material = create(:type_material)

      create(:type_material_spec_type_material, type_material_id: type_material.id, spec_type_material_id: @spec_type_material.id)

      expect(@spec_type_material.type_materials).to eq [type_material]
    end
  end
end
