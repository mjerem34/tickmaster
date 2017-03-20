require 'rails_helper'

RSpec.describe "field_sellers/index", type: :view do
  before(:each) do
    assign(:field_sellers, [
      FieldSeller.create!(
        :name => "Name"
      ),
      FieldSeller.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of field_sellers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
