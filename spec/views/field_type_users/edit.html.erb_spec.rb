require 'rails_helper'

RSpec.describe "field_type_users/edit", type: :view do
  before(:each) do
    @field_type_user = assign(:field_type_user, FieldTypeUser.create!(
      :type_user_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit field_type_user form" do
    render

    assert_select "form[action=?][method=?]", field_type_user_path(@field_type_user), "post" do

      assert_select "input#field_type_user_type_user_id[name=?]", "field_type_user[type_user_id]"

      assert_select "input#field_type_user_name[name=?]", "field_type_user[name]"
    end
  end
end
