require 'rails_helper'

RSpec.describe "procedures/new", type: :view do
  before(:each) do
    assign(:procedure, Procedure.new())
  end

  it "renders new procedure form" do
    render

    assert_select "form[action=?][method=?]", procedures_path, "post" do
    end
  end
end
