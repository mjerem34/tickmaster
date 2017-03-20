require 'rails_helper'

RSpec.describe "type_materials/show", type: :view do
  before(:each) do
    @type_material = assign(:type_material, TypeMaterial.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
