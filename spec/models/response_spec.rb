require 'rails_helper'
RSpec.describe Response, type: :model do
  before do
    @agency = create(:agency)
    @user = create(:user, agency_id: @agency.id)
    @admin = create(:admin, agency_id: @agency.id)
    @category = create(:category)
    @sous_category = create(:sous_category, category_id: @category.id)
    @incident = create(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 5)
  end
  it { expect(build(:response, incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)).to be_valid }

  it { expect(build(:response, incident_id: nil, sender_id: @user.id, receiver_id: @admin.id)).not_to be_valid }

  it { expect(build(:response, incident_id: @incident.id, sender_id: nil, receiver_id: @admin.id)).not_to be_valid }

  it { expect(build(:response, incident_id: @incident.id, sender_id: @user.id, receiver_id: nil)).not_to be_valid }

  it { expect(build(:response, content: nil, incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)).not_to be_valid }

  it { expect(build(:response, content: SecureRandom.hex(32_769), incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)).not_to be_valid }

  it { expect(build(:response, content: SecureRandom.hex(32_767), incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)).to be_valid }

  it { expect(build(:response, ip_address_sender: nil, incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)).not_to be_valid }

  it { expect(build(:response, ip_address_sender: SecureRandom.hex(3), incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)).not_to be_valid }

  context 'with response created' do
    before { @response = create(:response, incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id) }

    it { expect(@response.sender).to eq @user }

    it { expect(@response.receiver).to eq @admin }

    it { expect(@response.incident).to eq @incident }
  end
end
