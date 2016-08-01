require 'rails_helper'

RSpec.describe "sellers/new", type: :view do
  before(:each) do
    assign(:seller, Seller.new())
  end

  it "renders new seller form" do
    render

    assert_select "form[action=?][method=?]", sellers_path, "post" do
    end
  end
end
