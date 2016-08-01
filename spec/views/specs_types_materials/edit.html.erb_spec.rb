require 'rails_helper'

RSpec.describe "specs_types_materials/edit", type: :view do
  before(:each) do
    @specs_types_material = assign(:specs_types_material, SpecsTypesMaterial.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit specs_types_material form" do
    render

    assert_select "form[action=?][method=?]", specs_types_material_path(@specs_types_material), "post" do

      assert_select "input#specs_types_material_name[name=?]", "specs_types_material[name]"
    end
  end
end
