require 'rails_helper'
RSpec.describe DetentorType, type: :model do
  it { expect(build(:detentor_type)).to be_valid }

  it { expect(build(:detentor_type, name: nil)).not_to be_valid }

  it 'not valid if there is a double' do
    detentor_type = create(:detentor_type)
    expect(build(:detentor_type, name: detentor_type.name)).not_to be_valid
  end
  it 'return materials' do
    seller = create(:seller)
    type_material = create(:type_material)
    detentor_type = create(:detentor_type)
    material = create(:material, type_material_id: type_material.id, seller_id: seller.id, detentor_type_id: detentor_type.id)

    expect(detentor_type.materials).to eq [material]
  end
end
