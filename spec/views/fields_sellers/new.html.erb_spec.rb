require 'rails_helper'

RSpec.describe "field_sellers/new", type: :view do
  before(:each) do
    assign(:field_seller, FieldSeller.new(
      :name => "MyString"
    ))
  end

  it "renders new field_seller form" do
    render

    assert_select "form[action=?][method=?]", field_sellers_path, "post" do

      assert_select "input#field_seller_name[name=?]", "field_seller[name]"
    end
  end
end
