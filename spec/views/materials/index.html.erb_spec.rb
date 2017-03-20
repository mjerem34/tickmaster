require 'rails_helper'

RSpec.describe "materials/index", type: :view do
  before(:each) do
    assign(:materials, [
      Material.create!(
        :type_material_id => 1,
        :detentor_type_id => 2,
        :detentor_id => 3,
        :seller_id => 4
      ),
      Material.create!(
        :type_material_id => 1,
        :detentor_type_id => 2,
        :detentor_id => 3,
        :seller_id => 4
      )
    ])
  end

  it "renders a list of materials" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
