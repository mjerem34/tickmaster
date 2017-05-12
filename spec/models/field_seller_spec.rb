require 'rails_helper'
RSpec.describe FieldSeller, type: :model do
  it { expect(build(:field_seller)).to be_valid }
  it { expect(build(:field_seller, name: nil)).not_to be_valid }
  it 'is not valid if double #name' do
    field_seller = create(:field_seller)

    expect(build(:field_seller, name: field_seller.name)).not_to be_valid
  end
  it 'return sellers'
end
