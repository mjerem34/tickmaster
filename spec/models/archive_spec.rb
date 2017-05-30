require 'rails_helper'
RSpec.describe Archive, type: :model do
  before do
    @agency = create(:agency)
    @user = create(:user, agency_id: @agency.id)
    @admin = create(:admin, agency_id: @agency.id)
    @category = create(:category)
    @sous_category = create(:sous_category, category_id: @category.id)
    @incident = create(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 5)
  end
  it { expect(build(:archive, incident_id: @incident.id, sender_id: @user.id)).to be_valid }

  it { expect(build(:archive, incident_id: nil, sender_id: @user.id)).not_to be_valid }

  it { expect(build(:archive, incident_id: @incident.id, sender_id: nil)).not_to be_valid }

  it { expect(build(:archive, content: nil, incident_id: @incident.id, sender_id: @user.id)).not_to be_valid }

  it { expect(build(:archive, content: SecureRandom.hex(32_769), incident_id: @incident.id, sender_id: @user.id)).not_to be_valid }

  it { expect(build(:archive, content: SecureRandom.hex(32_767), incident_id: @incident.id, sender_id: @user.id)).to be_valid }

  it { expect(build(:archive, ip_address_sender: nil, incident_id: @incident.id, sender_id: @user.id)).not_to be_valid }

  it { expect(build(:archive, ip_address_sender: SecureRandom.hex(3), incident_id: @incident.id, sender_id: @user.id)).not_to be_valid }

  context 'with archive created' do
    before { @archive = create(:archive, incident_id: @incident.id, sender_id: @user.id) }

    it { expect(@archive.sender).to eq @user }

    it { expect(@archive.receiver).to eq @admin }

    it { expect(@archive.incident).to eq @incident }
  end
end
