require 'rails_helper'

RSpec.describe "type_materials/index", type: :view do
  before(:each) do
    assign(:type_materials, [
      TypeMaterial.create!(
        :name => "Name"
      ),
      TypeMaterial.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of type_materials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
