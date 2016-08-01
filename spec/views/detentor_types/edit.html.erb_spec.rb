require 'rails_helper'

RSpec.describe "detentor_types/edit", type: :view do
  before(:each) do
    @detentor_type = assign(:detentor_type, DetentorType.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit detentor_type form" do
    render

    assert_select "form[action=?][method=?]", detentor_type_path(@detentor_type), "post" do

      assert_select "input#detentor_type_name[name=?]", "detentor_type[name]"
    end
  end
end
