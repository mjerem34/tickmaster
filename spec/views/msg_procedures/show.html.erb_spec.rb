require 'rails_helper'

RSpec.describe "msg_procedures/show", type: :view do
  before(:each) do
    @msg_procedure = assign(:msg_procedure, MsgProcedure.create!(
      :id_procedures => 1,
      :contenu => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
