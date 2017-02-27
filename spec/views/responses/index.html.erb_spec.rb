require 'rails_helper'

RSpec.describe "responses/index", type: :view do
  before(:each) do
    assign(:responses, [
      Response.create!(),
      Response.create!()
    ])
  end

  it "renders a list of responses" do
    render
  end
end
