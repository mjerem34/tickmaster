require 'rails_helper'

RSpec.describe "rights/edit", type: :view do
  before(:each) do
    @right = assign(:right, Right.create!())
  end

  it "renders the edit right form" do
    render

    assert_select "form[action=?][method=?]", right_path(@right), "post" do
    end
  end
end
