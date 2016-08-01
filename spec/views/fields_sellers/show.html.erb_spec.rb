require 'rails_helper'

RSpec.describe "fields_sellers/show", type: :view do
  before(:each) do
    @fields_seller = assign(:fields_seller, FieldsSeller.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
