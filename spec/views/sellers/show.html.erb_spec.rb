require 'rails_helper'

RSpec.describe "sellers/show", type: :view do
  before(:each) do
    @seller = assign(:seller, Seller.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
