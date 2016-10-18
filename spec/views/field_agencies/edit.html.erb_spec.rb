require 'rails_helper'

RSpec.describe "field_agencies/edit", type: :view do
  before(:each) do
    @field_agency = assign(:field_agency, FieldAgency.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit field_agency form" do
    render

    assert_select "form[action=?][method=?]", field_agency_path(@field_agency), "post" do

      assert_select "input#field_agency_name[name=?]", "field_agency[name]"
    end
  end
end
