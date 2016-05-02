require 'rails_helper'

RSpec.describe "msg_procedures/index", type: :view do
  before(:each) do
    assign(:msg_procedures, [
      MsgProcedure.create!(
        :id_procedures => 1,
        :contenu => "MyText"
      ),
      MsgProcedure.create!(
        :id_procedures => 1,
        :contenu => "MyText"
      )
    ])
  end

  it "renders a list of msg_procedures" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
