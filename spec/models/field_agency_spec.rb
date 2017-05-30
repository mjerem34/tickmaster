require 'rails_helper'
RSpec.describe FieldAgency, type: :model do
  it { expect(build(:field_agency)).to be_valid }

  it { expect(build(:field_agency, name: nil)).not_to be_valid }

  it 'is not valid if there is a double #name' do
    field_agency = create(:field_agency)

    expect(build(:field_agency, name: field_agency.name)).not_to be_valid
  end

  it 'return agencies' do
    field_agency = create(:field_agency)
    agency = create(:agency)
    create(:field_agency_agency, agency_id: agency.id, field_agency_id: field_agency.id)

    expect(field_agency.agencies).to eq [agency]
  end
end
