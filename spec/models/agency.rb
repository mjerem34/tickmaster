require 'rails_helper'
RSpec.describe Agency, type: :model do
  it "should create the agency if all fields are filled" do
    expect(build(:agency)).to be_valid
  end
  it "should fail if name is missing" do
    expect(build(:agency, name: nil)).to_not be_valid
  end
  it "should fail if ip_adress is missing" do
    expect(build(:agency, ip_adress: nil)).to_not be_valid
  end
  it "should fail if there is a double name in db" do
    agency = create(:agency)
    expect(build(:agency, name: agency.name)).to_not be_valid
  end
  it "should show users" do
    agency = create(:agency)
    user = create(:user, agency_id: agency.id)

    expect(agency.users).to eq [user]
  end
  it "should show incidents"
  # TODO: Finish here !!!
end
