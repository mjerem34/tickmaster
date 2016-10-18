require 'rails_helper'

RSpec.describe "type_users/show", type: :view do
  before(:each) do
    @type_user = assign(:type_user, TypeUser.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
