require 'rails_helper'

RSpec.describe "procedures/edit", type: :view do
  before(:each) do
    @procedure = assign(:procedure, Procedure.create!())
  end

  it "renders the edit procedure form" do
    render

    assert_select "form[action=?][method=?]", procedure_path(@procedure), "post" do
    end
  end
end
