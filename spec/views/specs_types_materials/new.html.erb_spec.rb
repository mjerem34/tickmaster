require 'rails_helper'

RSpec.describe "specs_types_materials/new", type: :view do
  before(:each) do
    assign(:specs_types_material, SpecsTypesMaterial.new(
      :name => "MyString"
    ))
  end

  it "renders new specs_types_material form" do
    render

    assert_select "form[action=?][method=?]", specs_types_materials_path, "post" do

      assert_select "input#specs_types_material_name[name=?]", "specs_types_material[name]"
    end
  end
end
