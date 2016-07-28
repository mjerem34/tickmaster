require 'rails_helper'

RSpec.describe "procedures/index", type: :view do
  before(:each) do
    assign(:procedures, [
      Procedure.create!(),
      Procedure.create!()
    ])
  end

  it "renders a list of procedures" do
    render
  end
end
