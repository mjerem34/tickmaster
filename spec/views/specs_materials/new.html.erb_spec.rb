require 'rails_helper'

RSpec.describe "spec_materials/new", type: :view do
  before(:each) do
    assign(:spec_material, SpecMaterial.new(
      :spec_type_material_id => 1,
      :spec_value => "MyString"
    ))
  end

  it "renders new spec_material form" do
    render

    assert_select "form[action=?][method=?]", spec_materials_path, "post" do

      assert_select "input#spec_material_spec_type_material_id[name=?]", "spec_material[spec_type_material_id]"

      assert_select "input#spec_material_spec_value[name=?]", "spec_material[spec_value]"
    end
  end
end
