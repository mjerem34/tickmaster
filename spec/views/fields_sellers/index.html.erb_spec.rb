require 'rails_helper'

RSpec.describe "fields_sellers/index", type: :view do
  before(:each) do
    assign(:fields_sellers, [
      FieldsSeller.create!(
        :name => "Name"
      ),
      FieldsSeller.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of fields_sellers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
