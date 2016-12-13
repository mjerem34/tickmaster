require 'rails_helper'

RSpec.describe "specs_materials/index", type: :view do
  before(:each) do
    assign(:specs_materials, [
      SpecsMaterial.create!(
        :specs_types_material_id => 1,
        :spec_value => "Spec Value"
      ),
      SpecsMaterial.create!(
        :specs_types_material_id => 1,
        :spec_value => "Spec Value"
      )
    ])
  end

  it "renders a list of specs_materials" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Spec Value".to_s, :count => 2
  end
end
