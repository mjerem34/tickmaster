require 'rails_helper'

RSpec.describe "spec_type_materials/index", type: :view do
  before(:each) do
    assign(:spec_type_materials, [
      SpecTypeMaterial.create!(
        :name => "Name"
      ),
      SpecTypeMaterial.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of spec_type_materials" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
