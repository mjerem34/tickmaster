require 'rails_helper'
RSpec.describe Incident, type: :model do
  before do
    @agency = create(:agency)
    @user = create(:user, agency_id: @agency.id)
    @admin = create(:admin, agency_id: @agency.id)
    @category = create(:category)
    @sous_category = create(:sous_category, category_id: @category.id)
  end

  it { expect(build(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 10)).to be_valid }

  it { expect(build(:incident, title: SecureRandom.hex(99), user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 10)).to be_valid }

  it { expect(build(:incident, title: SecureRandom.hex(100), user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 10)).not_to be_valid }

  it { expect(build(:incident, user_id: nil, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 10)).not_to be_valid }

  it { expect(build(:incident, user_id: @user.id, tech_id: nil, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 10)).not_to be_valid }

  it { expect(build(:incident, user_id: @user.id, tech_id: @admin.id, category_id: nil, sous_category_id: @sous_category.id, lvl_urgence_user: 10)).not_to be_valid }

  it { expect(build(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: nil, lvl_urgence_user: 10)).not_to be_valid }

  it { expect(build(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: nil)).not_to be_valid }

  it 'set lvl urgence to max of sous_category max urgence if it is higher' do
    incident = create(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 20)

    expect(incident.lvl_urgence_user).to eq @sous_category.lvl_urgence_max
  end
  it "don't touch the lvl urgence if it is lower than the sous_category max urgence" do
    incident = create(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 5)

    expect(incident.lvl_urgence_user).not_to eq @sous_category.lvl_urgence_max
  end
  context 'with incident created' do
    before { @incident = create(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 5) }

    it 'render responses of the incident' do
      response = create(:response, incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)

      expect(@incident.responses).to eq [response]
    end
    it 'render archives of the incident' do
      archive = create(:archive, incident_id: @incident.id, sender_id: @user.id, receiver_id: @admin.id)

      expect(@incident.archives).to eq [archive]
    end

    it { expect(@incident.user).to eq @user }

    it { expect(@incident.tech).to eq @admin }

    it { expect(@incident.category).to eq @category }

    it { expect(@incident.sous_category).to eq @sous_category }

    it { expect(@incident.user.agency).to eq @agency }

    it { expect(@incident.incident_state_id_for_tech.name).to eq IncidentsState.find(@incident.incident_state_id_for_tech.id).name }

    it { expect(@incident.incident_state_id_for_user.name).to eq IncidentsState.find(@incident.incident_state_id_for_user.id).name }
  end
end
