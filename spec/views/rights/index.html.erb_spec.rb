require 'rails_helper'

RSpec.describe "rights/index", type: :view do
  before(:each) do
    assign(:rights, [
      Right.create!(),
      Right.create!()
    ])
  end

  it "renders a list of rights" do
    render
  end
end
