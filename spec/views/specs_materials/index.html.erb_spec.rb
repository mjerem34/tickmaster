require 'rails_helper'

RSpec.describe "spec_materials/index", type: :view do
  before(:each) do
    assign(:spec_materials, [
      SpecMaterial.create!(
        :spec_type_material_id => 1,
        :spec_value => "Spec Value"
      ),
      SpecMaterial.create!(
        :spec_type_material_id => 1,
        :spec_value => "Spec Value"
      )
    ])
  end

  it "renders a list of spec_materials" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Spec Value".to_s, :count => 2
  end
end
