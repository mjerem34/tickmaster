require 'rails_helper'

RSpec.describe "detentor_types/new", type: :view do
  before(:each) do
    assign(:detentor_type, DetentorType.new(
      :name => "MyString"
    ))
  end

  it "renders new detentor_type form" do
    render

    assert_select "form[action=?][method=?]", detentor_types_path, "post" do

      assert_select "input#detentor_type_name[name=?]", "detentor_type[name]"
    end
  end
end
