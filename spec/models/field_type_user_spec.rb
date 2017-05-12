require 'rails_helper'
RSpec.describe FieldTypeUser, type: :model do
  before do
    @agency = create(:agency)
    @user = create(:user, agency_id: @agency.id)
    @field_type_user = create(:field_type_user)
    @type_user = create(:type_user)
    create(:field_user,
           user_id: @user.id,
           field_type_user_id: @field_type_user.id)
    create(:field_type_user_type_user,
           type_user_id: @type_user.id,
           field_type_user_id: @field_type_user.id)
  end
  it { expect(build(:field_type_user)).to be_valid }
  it { expect(build(:field_type_user, name: nil)).not_to be_valid }
  it { expect(build(:field_type_user, name: @field_type_user.name)).not_to be_valid }
  it { expect(@field_type_user.field_users.first.user).to eq @user }
  it { expect(@field_type_user.field_type_user_type_users.first.type_user).to eq @type_user }
  it { expect { @field_type_user.destroy }.to change { FieldTypeUserTypeUser.count }.by(-1) }
  it { expect { @field_type_user.destroy }.to change { FieldUser.count }.by(-1) }
end
