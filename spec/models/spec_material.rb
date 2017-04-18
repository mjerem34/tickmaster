require 'rails_helper'
RSpec.describe SpecMaterial, type: :model do
  before { @stm = create(:spec_type_material) }

  it { expect(build(:spec_material, spec_type_material_id: @stm.id)).to be_valid }

  it { expect(build(:spec_material, spec_value: nil, spec_type_material_id: @stm.id )).not_to be_valid }

  it { expect(build(:spec_material, spec_type_material_id: nil)).not_to be_valid }

  it { expect(build(:spec_material, spec_value: SecureRandom.hex(127), spec_type_material_id: @stm.id)).to be_valid }

  it { expect(build(:spec_material, spec_value: SecureRandom.hex(128), spec_type_material_id: @stm.id)).not_to be_valid }

  it "should not be valid if double #spec_value" do
    spec_material = create(:spec_material, spec_type_material_id: @stm.id)

    expect(build(:spec_material, spec_value: spec_material.spec_value)).not_to be_valid
  end

  it "should render spec_type_material" do
    spec_material = create(:spec_material, spec_type_material_id: @stm.id)

    expect(spec_material.spec_type_material)
  end

  it "should render materials" do
    spec_material = create(:spec_material, spec_type_material_id: @stm.id)
    type_material = create(:type_material)
    detentor_type = create(:detentor_type)
    seller = create(:seller)
    material = create(:material, type_material_id: type_material.id, seller_id: seller.id, detentor_type_id: detentor_type.id, detentor_id: 1)

    create(:spec_material_material, spec_material_id: spec_material.id, material_id: material.id)

    expect(spec_material.materials).to eq [material]
  end
end
