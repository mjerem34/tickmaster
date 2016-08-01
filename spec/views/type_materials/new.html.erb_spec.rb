require 'rails_helper'

RSpec.describe "type_materials/new", type: :view do
  before(:each) do
    assign(:type_material, TypeMaterial.new(
      :name => "MyString"
    ))
  end

  it "renders new type_material form" do
    render

    assert_select "form[action=?][method=?]", type_materials_path, "post" do

      assert_select "input#type_material_name[name=?]", "type_material[name]"
    end
  end
end
