require 'rails_helper'
RSpec.describe Seller, type: :model do
  it { expect(build(:seller)).to be_valid }

  it { expect(build(:seller, name: nil)).not_to be_valid }

  it { expect(build(:seller, name: SecureRandom.hex(128))).not_to be_valid }

  it { expect(build(:seller, name: SecureRandom.hex(127))).to be_valid }

  it "is invalid if double #name" do
    seller = create(:seller)

    expect(build(:seller, name: seller.name)).not_to be_valid
  end

  it "set actif to true on creation" do
    seller = create(:seller)

    expect(seller.actif).to eq true
  end

  it "should return materials" do
    type_material = create(:type_material)
    detentor_type = create(:detentor_type)
    seller = create(:seller)

    material = create(:material, type_material_id: type_material.id, seller_id: seller.id, detentor_type_id: detentor_type.id, detentor_id: 1)

    expect(seller.materials).to eq [material]
  end

  it "should return type_materials the seller sells" do
    type_material = create(:type_material)
    seller = create(:seller)

    create(:type_material_seller, type_material_id: type_material.id, seller_id: seller.id)

    expect(seller.type_materials).to eq [type_material]
  end

  it "should return the field_sellers the seller have" do
    field_seller = create(:field_seller)
    seller = create(:seller)

    create(:field_seller_seller, field_seller_id: field_seller.id, seller_id: seller.id)

    expect(seller.field_sellers).to eq [field_seller]
  end
end
