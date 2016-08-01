require 'rails_helper'

RSpec.describe "specs_types_materials/show", type: :view do
  before(:each) do
    @specs_types_material = assign(:specs_types_material, SpecsTypesMaterial.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
