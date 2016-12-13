require 'rails_helper'

RSpec.describe "spec_type_materials/new", type: :view do
  before(:each) do
    assign(:spec_type_material, SpecTypeMaterial.new(
      :name => "MyString"
    ))
  end

  it "renders new spec_type_material form" do
    render

    assert_select "form[action=?][method=?]", spec_type_materials_path, "post" do

      assert_select "input#spec_type_material_name[name=?]", "spec_type_material[name]"
    end
  end
end
