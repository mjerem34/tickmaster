require 'rails_helper'
RSpec.describe IncidentsState, type: :model do
  it { expect(build(:incidents_state)).to be_valid }
  it { expect(build(:incidents_state, name: nil)).not_to be_valid }
  it { expect(build(:incidents_state, shortcut: nil)).not_to be_valid }
  it { expect(build(:incidents_state, user_color: nil)).not_to be_valid }
  it { expect(build(:incidents_state, tech_color: nil)).not_to be_valid }
  context 'if there is a double' do
    before { @incidents_state = create(:incidents_state) }
    it { expect(build(:incidents_state, name: @incidents_state.name)).not_to be_valid }
    it { expect(build(:incidents_state, shortcut: @incidents_state.shortcut)).not_to be_valid }
  end
  # TODO: Finish here !!
  it 'return incidents where incident_state_id_for_user'
  it 'return incidents where incident_state_id_for_tech'
end
