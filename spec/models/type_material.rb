require 'rails_helper'
RSpec.describe TypeMaterial, type: :model do
  it { expect(build(:type_material)).to be_valid }
  it { expect(build(:type_material, name: nil)).not_to be_valid }
  it { expect(build(:type_material, name: SecureRandom.hex(127))).to be_valid }
  it { expect(build(:type_material, name: SecureRandom.hex(128))).not_to be_valid }

  it "not valid if double" do
    @tm = create(:type_material)

    expect(build(:type_material, name: @tm.name)).not_to be_valid
  end

  context "with type_material created" do
    before { @tm = create(:type_material) }
    it "return materials" do
      detentor_type = create(:detentor_type)
      seller = create(:seller)

      material = create(:material, type_material_id: @tm.id, detentor_type_id: detentor_type.id, seller_id: seller.id)

      expect(@tm.materials).to eq [material]
    end

    it "return sellers" do
      seller = create(:seller)

      create(:type_material_seller, seller_id: seller.id, type_material_id: @tm.id)

      expect(@tm.sellers).to eq [seller]
    end

    it "return spec_type_materials" do
      spec_type_material = create(:spec_type_material)

      create(:type_material_spec_type_material, type_material_id: @tm.id, spec_type_material_id: spec_type_material.id)

      expect(@tm.spec_type_materials).to eq [spec_type_material]
    end
  end
end
