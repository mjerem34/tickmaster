require 'rails_helper'

RSpec.describe User, type: :model do
  setup :activate_authlogic
  before { @agency = create(:agency) }
  it 'is valid if nothing is missing' do
    expect(build(:user, agency_id: @agency.id)).to be_valid
  end
  it 'is invalid without a surname' do
    expect(build(:user, surname: nil, agency_id: @agency.id)).not_to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:user, name: nil, agency_id: @agency.id)).not_to be_valid
  end
  it 'is invalid without a email' do
    expect(build(:user, email: nil, agency_id: @agency.id)).not_to be_valid
  end
  it 'is invalid without a type_user' do
    expect(build(:user, type_user_id: nil, agency_id: @agency.id)).not_to be_valid
  end
  it 'is invalid without an agency' do
    expect(build(:user, agency_id: nil)).not_to be_valid
  end
  context 'when there is a double in db' do
    it 'is invalid if email is taken' do
      create(:user, email: 'test@test.test', agency_id: @agency.id)
      expect(build(:user, email: 'test@test.test', agency_id: @agency.id)).not_to be_valid
    end
  end
end
