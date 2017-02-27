require 'rails_helper'

RSpec.describe "type_users/edit", type: :view do
  before(:each) do
    @type_user = assign(:type_user, TypeUser.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit type_user form" do
    render

    assert_select "form[action=?][method=?]", type_user_path(@type_user), "post" do

      assert_select "input#type_user_name[name=?]", "type_user[name]"
    end
  end
end
