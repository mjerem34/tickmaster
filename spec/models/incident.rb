require 'rails_helper'
RSpec.describe Incident, type: :model do
  before do
    @agency = create(:agency)
    @user = create(:user, agency_id: @agency.id)
    @admin = create(:admin, agency_id: @agency.id)
    @category = create(:category)
    @sous_category = create(:sous_category, category_id: @category.id)
  end

  it { expect(build(:incident, user_id: @user.id, tech_id: @admin.id, category_id: @category.id, sous_category_id: @sous_category.id, lvl_urgence_user: 10, incident_state_id_for_user_id: 1, incident_state_id_for_tech_id: 1, cloture_user: true, cloture_tech: true, notify_for_user: true, notify_for_tech: false)).to be_valid }

end
