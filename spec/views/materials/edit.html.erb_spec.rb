require 'rails_helper'

RSpec.describe "materials/edit", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :type_material_id => 1,
      :detentor_type_id => 1,
      :detentor_id => 1,
      :seller_id => 1
    ))
  end

  it "renders the edit material form" do
    render

    assert_select "form[action=?][method=?]", material_path(@material), "post" do

      assert_select "input#material_type_material_id[name=?]", "material[type_material_id]"

      assert_select "input#material_detentor_type_id[name=?]", "material[detentor_type_id]"

      assert_select "input#material_detentor_id[name=?]", "material[detentor_id]"

      assert_select "input#material_seller_id[name=?]", "material[seller_id]"
    end
  end
end
