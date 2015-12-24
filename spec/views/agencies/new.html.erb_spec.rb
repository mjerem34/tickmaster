require 'rails_helper'

RSpec.describe "agencies/new", type: :view do
  before(:each) do
    assign(:agency, Agency.new())
  end

  it "renders new agency form" do
    render

    assert_select "form[action=?][method=?]", agencies_path, "post" do
    end
  end
end
