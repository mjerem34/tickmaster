require 'rails_helper'

RSpec.describe "detentor_types/index", type: :view do
  before(:each) do
    assign(:detentor_types, [
      DetentorType.create!(
        :name => "Name"
      ),
      DetentorType.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of detentor_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
