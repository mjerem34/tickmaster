require 'rails_helper'

RSpec.describe "spec_type_materials/show", type: :view do
  before(:each) do
    @spec_type_material = assign(:spec_type_material, SpecTypeMaterial.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
