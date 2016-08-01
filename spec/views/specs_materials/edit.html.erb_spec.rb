require 'rails_helper'

RSpec.describe "specs_materials/edit", type: :view do
  before(:each) do
    @specs_material = assign(:specs_material, SpecsMaterial.create!(
      :spec_type_material_id => 1,
      :spec_value => "MyString"
    ))
  end

  it "renders the edit specs_material form" do
    render

    assert_select "form[action=?][method=?]", specs_material_path(@specs_material), "post" do

      assert_select "input#specs_material_spec_type_material_id[name=?]", "specs_material[spec_type_material_id]"

      assert_select "input#specs_material_spec_value[name=?]", "specs_material[spec_value]"
    end
  end
end
