require 'rails_helper'

RSpec.describe "field_agencies/index", type: :view do
  before(:each) do
    assign(:field_agencies, [
      FieldAgency.create!(
        :name => "Name"
      ),
      FieldAgency.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of field_agencies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
