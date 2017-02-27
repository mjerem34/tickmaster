require 'rails_helper'

RSpec.describe "procedures/show", type: :view do
  before(:each) do
    @procedure = assign(:procedure, Procedure.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
