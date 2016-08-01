require 'rails_helper'

RSpec.describe "fields_sellers/edit", type: :view do
  before(:each) do
    @fields_seller = assign(:fields_seller, FieldsSeller.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit fields_seller form" do
    render

    assert_select "form[action=?][method=?]", fields_seller_path(@fields_seller), "post" do

      assert_select "input#fields_seller_name[name=?]", "fields_seller[name]"
    end
  end
end
