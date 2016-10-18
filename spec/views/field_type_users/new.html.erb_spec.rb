require 'rails_helper'

RSpec.describe "field_type_users/new", type: :view do
  before(:each) do
    assign(:field_type_user, FieldTypeUser.new(
      :type_user_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new field_type_user form" do
    render

    assert_select "form[action=?][method=?]", field_type_users_path, "post" do

      assert_select "input#field_type_user_type_user_id[name=?]", "field_type_user[type_user_id]"

      assert_select "input#field_type_user_name[name=?]", "field_type_user[name]"
    end
  end
end
