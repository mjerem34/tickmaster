require 'rails_helper'

RSpec.describe "spec_materials/edit", type: :view do
  before(:each) do
    @spec_material = assign(:spec_material, SpecMaterial.create!(
      :spec_type_material_id => 1,
      :spec_value => "MyString"
    ))
  end

  it "renders the edit spec_material form" do
    render

    assert_select "form[action=?][method=?]", spec_material_path(@spec_material), "post" do

      assert_select "input#spec_material_spec_type_material_id[name=?]", "spec_material[spec_type_material_id]"

      assert_select "input#spec_material_spec_value[name=?]", "spec_material[spec_value]"
    end
  end
end
