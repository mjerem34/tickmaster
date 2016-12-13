require 'rails_helper'

RSpec.describe "spec_type_materials/edit", type: :view do
  before(:each) do
    @spec_type_material = assign(:spec_type_material, SpecTypeMaterial.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit spec_type_material form" do
    render

    assert_select "form[action=?][method=?]", spec_type_material_path(@spec_type_material), "post" do

      assert_select "input#spec_type_material_name[name=?]", "spec_type_material[name]"
    end
  end
end
