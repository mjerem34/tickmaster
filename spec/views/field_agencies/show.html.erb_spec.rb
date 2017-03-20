require 'rails_helper'

RSpec.describe "field_agencies/show", type: :view do
  before(:each) do
    @field_agency = assign(:field_agency, FieldAgency.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
