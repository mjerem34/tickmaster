require 'rails_helper'

RSpec.describe "incidents/index", type: :view do
  before(:each) do
    assign(:incidents, [
      Incident.create!(),
      Incident.create!()
    ])
  end

  it "renders a list of incidents" do
    render
  end
end
