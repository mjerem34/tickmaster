require 'rails_helper'

RSpec.describe "teches/edit", type: :view do
  before(:each) do
    @tech = assign(:tech, Tech.create!())
  end

  it "renders the edit tech form" do
    render

    assert_select "form[action=?][method=?]", tech_path(@tech), "post" do
    end
  end
end
