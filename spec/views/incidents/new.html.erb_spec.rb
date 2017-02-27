require 'rails_helper'

RSpec.describe "incidents/new", type: :view do
  before(:each) do
    assign(:incident, Incident.new())
  end

  it "renders new incident form" do
    render

    assert_select "form[action=?][method=?]", incidents_path, "post" do
    end
  end
end
