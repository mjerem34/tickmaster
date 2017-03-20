require 'rails_helper'

RSpec.describe "field_sellers/edit", type: :view do
  before(:each) do
    @field_seller = assign(:field_seller, FieldSeller.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit field_seller form" do
    render

    assert_select "form[action=?][method=?]", field_seller_path(@field_seller), "post" do

      assert_select "input#field_seller_name[name=?]", "field_seller[name]"
    end
  end
end
