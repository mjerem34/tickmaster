require 'rails_helper'

RSpec.describe "rights/new", type: :view do
  before(:each) do
    assign(:right, Right.new())
  end

  it "renders new right form" do
    render

    assert_select "form[action=?][method=?]", rights_path, "post" do
    end
  end
end
