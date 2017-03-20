require 'rails_helper'

RSpec.describe "type_users/index", type: :view do
  before(:each) do
    assign(:type_users, [
      TypeUser.create!(
        :name => "Name"
      ),
      TypeUser.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of type_users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
