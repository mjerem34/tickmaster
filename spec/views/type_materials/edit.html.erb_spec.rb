require 'rails_helper'

RSpec.describe "type_materials/edit", type: :view do
  before(:each) do
    @type_material = assign(:type_material, TypeMaterial.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit type_material form" do
    render

    assert_select "form[action=?][method=?]", type_material_path(@type_material), "post" do

      assert_select "input#type_material_name[name=?]", "type_material[name]"
    end
  end
end
