require 'rails_helper'

RSpec.describe "rights/show", type: :view do
  before(:each) do
    @right = assign(:right, Right.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
