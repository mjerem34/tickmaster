require 'rails_helper'

RSpec.describe "field_sellers/show", type: :view do
  before(:each) do
    @field_seller = assign(:field_seller, FieldSeller.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
