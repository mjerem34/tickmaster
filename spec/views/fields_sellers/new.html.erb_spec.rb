require 'rails_helper'

RSpec.describe "fields_sellers/new", type: :view do
  before(:each) do
    assign(:fields_seller, FieldsSeller.new(
      :name => "MyString"
    ))
  end

  it "renders new fields_seller form" do
    render

    assert_select "form[action=?][method=?]", fields_sellers_path, "post" do

      assert_select "input#fields_seller_name[name=?]", "fields_seller[name]"
    end
  end
end
