require 'rails_helper'

RSpec.describe "updates/show", type: :view do
  before(:each) do
    @update = assign(:update, Update.create!(
      :changes => "Changes"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Changes/)
  end
end
