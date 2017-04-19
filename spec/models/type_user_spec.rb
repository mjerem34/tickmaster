require 'rails_helper'
RSpec.describe TypeUser, type: :model do
  it { expect(create(:type_user)).to be_valid }

  it { expect(build(:type_user, name: nil)).not_to be_valid }

  it { expect(build(:type_user, secure: nil)).not_to be_valid}

  it { expect(build(:type_user, is_tech: nil)).not_to be_valid}

  # ... Why 127/128 and not 255/256 ? Hex is two chars, 128*2=256 :)
  it { expect(build(:type_user, name: SecureRandom.hex(127))).to be_valid }

  it { expect(build(:type_user, name: SecureRandom.hex(128))).not_to be_valid }

  it "not create if double" do
    double = create(:type_user)

    expect(build(:type_user, name: double.name)).not_to be_valid
  end

  it "create and set #actif to true if not set" do
    type_user = create(:type_user, actif: nil)

    expect(type_user.actif).to eq true
  end

  it "return users" do
    agency = create(:agency)
    type_user = create(:type_user)
    user = create(:user, type_user_id: type_user.id, agency_id: agency.id)

    expect(type_user.users).to eq [user]
  end

  it "return field_type_users" do
    field_type_user = create(:field_type_user)
    type_user = create(:type_user)

    create(:field_type_user_type_user, type_user_id: type_user.id, field_type_user_id: field_type_user.id)

    expect(type_user.field_type_users).to eq [field_type_user]
  end

  it "return rights" do
    type_user = create(:type_user)
    right = create(:right)

    create(:type_user_right, type_user_id: type_user.id, right_id: right.id)

    expect(type_user.rights).to eq [right]
  end
end
