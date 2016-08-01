require 'rails_helper'

RSpec.describe "specs_types_materials/index", type: :view do
  before(:each) do
    assign(:specs_types_materials, [
      SpecsTypesMaterial.create!(
        :name => "Name"
      ),
      SpecsTypesMaterial.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of specs_types_materials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
