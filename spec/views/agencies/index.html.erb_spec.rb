require 'rails_helper'

RSpec.describe "agencies/index", type: :view do
  before(:each) do
    assign(:agencies, [
      Agency.create!(),
      Agency.create!()
    ])
  end

  it "renders a list of agencies" do
    render
  end
end
