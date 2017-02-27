require 'rails_helper'

RSpec.describe "field_type_users/index", type: :view do
  before(:each) do
    assign(:field_type_users, [
      FieldTypeUser.create!(
        :type_user_id => 2,
        :name => "Name"
      ),
      FieldTypeUser.create!(
        :type_user_id => 2,
        :name => "Name"
      )
    ])
  end

  it "renders a list of field_type_users" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
