require 'rails_helper'

RSpec.describe "field_type_users/show", type: :view do
  before(:each) do
    @field_type_user = assign(:field_type_user, FieldTypeUser.create!(
      :type_user_id => 2,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
  end
end
