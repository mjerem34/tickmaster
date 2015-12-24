require 'rails_helper'

RSpec.describe "teches/show", type: :view do
  before(:each) do
    @tech = assign(:tech, Tech.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
