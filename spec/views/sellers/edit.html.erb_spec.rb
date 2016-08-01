require 'rails_helper'

RSpec.describe "sellers/edit", type: :view do
  before(:each) do
    @seller = assign(:seller, Seller.create!())
  end

  it "renders the edit seller form" do
    render

    assert_select "form[action=?][method=?]", seller_path(@seller), "post" do
    end
  end
end
