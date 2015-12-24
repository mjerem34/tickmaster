require 'rails_helper'

RSpec.describe "teches/index", type: :view do
  before(:each) do
    assign(:teches, [
      Tech.create!(),
      Tech.create!()
    ])
  end

  it "renders a list of teches" do
    render
  end
end
