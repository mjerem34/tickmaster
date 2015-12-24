require 'rails_helper'

RSpec.describe "teches/new", type: :view do
  before(:each) do
    assign(:tech, Tech.new())
  end

  it "renders new tech form" do
    render

    assert_select "form[action=?][method=?]", teches_path, "post" do
    end
  end
end
