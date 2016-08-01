require 'rails_helper'

RSpec.describe "detentor_types/show", type: :view do
  before(:each) do
    @detentor_type = assign(:detentor_type, DetentorType.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
