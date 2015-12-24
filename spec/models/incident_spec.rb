require 'rails_helper'

RSpec.describe Incident, type: :model do
  before :each do
    @incident = {
      title: 'test',
      content: 'incident_content',
      category_id: 1,
      sous_category_id: 1,
      incident_state_id_for_user: 1,
      incident_state_id_for_tech: 1,
      tech_id: 1
    }
  end

  it "create should be pass" do
    incident = Incident.create!(@incident)
    expect(incident).to be_valid
  end

  it "should be fail if title is empty" do
    emptytitle = Incident.new(@incident.merge(title: ''))
    expect(emptytitle).to_not be_valid
  end
  it "should be fail if content is empty" do
      emptycontent = Incident.new(@incident.merge(content: ''))
      expect(emptycontent).to_not be_valid
    end

  it "should be fail if category_id is empty" do
    emptycat = Incident.new(@incident.merge(category_id: ''))
    expect(emptycat).to_not be_valid
  end
  it "should be fail if sous_category_id is empty" do
    emptysubcat = Incident.new(@incident.merge(sous_category_id: ''))
    expect(emptysubcat).to_not be_valid
  end
  it "control if evenement_type changed when incident is reaffected to a new tech" do
    incident = Incident.create!(@incident)
    incident.update_attribute(:tech_id, 2)
    expect(incident.incident_state_id_for_user).to eq(2)
  end
end
