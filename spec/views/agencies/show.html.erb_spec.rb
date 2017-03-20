require 'rails_helper'

RSpec.describe "agencies/show", type: :view do
  before(:each) do
    @agency = assign(:agency, Agency.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
