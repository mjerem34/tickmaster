require 'rails_helper'

RSpec.describe "specs_materials/new", type: :view do
  before(:each) do
    assign(:specs_material, SpecsMaterial.new(
      :specs_types_material_id => 1,
      :spec_value => "MyString"
    ))
  end

  it "renders new specs_material form" do
    render

    assert_select "form[action=?][method=?]", specs_materials_path, "post" do

      assert_select "input#specs_material_specs_types_material_id[name=?]", "specs_material[specs_types_material_id]"

      assert_select "input#specs_material_spec_value[name=?]", "specs_material[spec_value]"
    end
  end
end
