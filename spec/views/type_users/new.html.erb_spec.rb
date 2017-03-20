require 'rails_helper'

RSpec.describe "type_users/new", type: :view do
  before(:each) do
    assign(:type_user, TypeUser.new(
      :name => "MyString"
    ))
  end

  it "renders new type_user form" do
    render

    assert_select "form[action=?][method=?]", type_users_path, "post" do

      assert_select "input#type_user_name[name=?]", "type_user[name]"
    end
  end
end
