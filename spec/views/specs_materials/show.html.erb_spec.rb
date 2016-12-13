require 'rails_helper'

RSpec.describe "spec_materials/show", type: :view do
  before(:each) do
    @spec_material = assign(:spec_material, SpecMaterial.create!(
      :spec_type_material_id => 1,
      :spec_value => "Spec Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Spec Value/)
  end
end
