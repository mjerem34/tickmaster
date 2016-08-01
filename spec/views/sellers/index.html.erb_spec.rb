require 'rails_helper'

RSpec.describe "sellers/index", type: :view do
  before(:each) do
    assign(:sellers, [
      Seller.create!(),
      Seller.create!()
    ])
  end

  it "renders a list of sellers" do
    render
  end
end
