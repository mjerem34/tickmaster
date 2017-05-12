require 'rails_helper'
RSpec.describe FieldAgency, type: :model do
  it { expect(build(:field_agency)).to be_valid }

  it { expect(build(:field_agency, name: nil)).not_to be_valid }

  it 'is not valid if there is a double #name' do
    field_agency = create(:field_agency)

    expect(build(:field_agency, name: field_agency.name)).not_to be_valid
  end

  it 'return agencies'
end
