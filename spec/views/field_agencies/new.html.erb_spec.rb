require 'rails_helper'

RSpec.describe "field_agencies/new", type: :view do
  before(:each) do
    assign(:field_agency, FieldAgency.new(
      :name => "MyString"
    ))
  end

  it "renders new field_agency form" do
    render

    assert_select "form[action=?][method=?]", field_agencies_path, "post" do

      assert_select "input#field_agency_name[name=?]", "field_agency[name]"
    end
  end
end
