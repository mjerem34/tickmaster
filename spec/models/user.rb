require 'rails_helper'
RSpec.describe User, type: :model do
  before { @agency = create(:agency) }
  it "is valid if nothing is missing" do
    expect(build(:user, agency_id: @agency.id)).to be_valid
  end
  it "is invalid without a surname" do
    expect(build(:user, surname: nil, agency_id: @agency.id)).to_not be_valid
  end
  it "is invalid without a name" do
    expect(build(:user, name: nil, agency_id: @agency.id)).to_not be_valid
  end
  it "is invalid without a pseudo" do
    expect(build(:user, pseudo: nil, agency_id: @agency.id)).to_not be_valid
  end
  it "is invalid without a email" do
    expect(build(:user, email: nil, agency_id: @agency.id)).to_not be_valid
  end
  it "is invalid without a type_user" do
    expect(build(:user, type_user_id: nil, agency_id: @agency.id)).to_not be_valid
  end
  it "is invalid without an agency" do
    expect(build(:user, agency_id: nil)).to_not be_valid
  end
  context "when there is a double in db" do
    it "is invalid if pseudo is taken" do
      create(:user, pseudo: "toto.toto", agency_id: @agency.id)
      expect(build(:user, pseudo: "toto.toTo", agency_id: @agency.id)).to_not be_valid
    end
    it "is valid if pseudo is not taken" do
      expect(create(:user, pseudo: "toto.toto", agency_id: @agency.id)).to be_valid
    end
  end
end
