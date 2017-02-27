require 'rails_helper'

RSpec.describe "materials/show", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :type_material_id => 1,
      :detentor_type_id => 2,
      :detentor_id => 3,
      :seller_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
