require 'rails_helper'
RSpec.describe FieldTypeUser, type: :model do
  it { expect(build(:field_type_user)).to be_valid }
  it { expect(build(:field_type_user, name: nil)).not_to be_valid }
  it "is invalid if double #name" do
    field_type_user = create(:field_type_user)

    expect(build(:field_type_user, name: field_type_user.name)).not_to be_valid
  end
  it "should return the type_users"
  it "should return the users"
end
