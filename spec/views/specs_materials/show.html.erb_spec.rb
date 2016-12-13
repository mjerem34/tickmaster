require 'rails_helper'

RSpec.describe "specs_materials/show", type: :view do
  before(:each) do
    @specs_material = assign(:specs_material, SpecsMaterial.create!(
      :specs_types_material_id => 1,
      :spec_value => "Spec Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Spec Value/)
  end
end
