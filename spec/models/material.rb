require 'rails_helper'
RSpec.describe Material, type: :model do
  before do
    @seller = create(:seller)
    @type_material = create(:type_material)
    @detentor_type = create(:detentor_type)
  end

  it { expect(create(:material, type_material_id: @type_material.id, seller_id: @seller.id, detentor_type_id: @detentor_type.id)).to be_valid }

  context "when material is created" do
    before do
      @material = create(:material, seller_id: @seller.id, type_material_id: @type_material.id, detentor_type_id: @detentor_type.id)
    end
    it "return type_material" do
      expect(@material.type_material).to eq @type_material
    end

    it "return seller" do
      expect(@material.seller).to eq @seller
    end

    it "return detentor_type" do
      expect(@material.detentor_type).to eq @detentor_type
    end
    it "return spec_materials" do
      spec_type_material = create(:spec_type_material)
      spec_material = create(:spec_material, spec_type_material_id: spec_type_material.id)

      create(:spec_material_material, spec_material_id: spec_material.id, material_id: @material.id)

      expect(@material.spec_materials).to eq [spec_material]
    end
  end
end
