require 'rails_helper'

RSpec.describe "responses/edit", type: :view do
  before(:each) do
    @response = assign(:response, Response.create!())
  end

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do
    end
  end
end
