require 'rails_helper'

RSpec.describe "agencies/edit", type: :view do
  before(:each) do
    @agency = assign(:agency, Agency.create!())
  end

  it "renders the edit agency form" do
    render

    assert_select "form[action=?][method=?]", agency_path(@agency), "post" do
    end
  end
end
