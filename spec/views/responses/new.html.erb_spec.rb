require 'rails_helper'

RSpec.describe "responses/new", type: :view do
  before(:each) do
    assign(:response, Response.new())
  end

  it "renders new response form" do
    render

    assert_select "form[action=?][method=?]", responses_path, "post" do
    end
  end
end
