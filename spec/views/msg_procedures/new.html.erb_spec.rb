require 'rails_helper'

RSpec.describe "msg_procedures/new", type: :view do
  before(:each) do
    assign(:msg_procedure, MsgProcedure.new(
      :id_procedures => 1,
      :contenu => "MyText"
    ))
  end

  it "renders new msg_procedure form" do
    render

    assert_select "form[action=?][method=?]", msg_procedures_path, "post" do

      assert_select "input#msg_procedure_id_procedures[name=?]", "msg_procedure[id_procedures]"

      assert_select "textarea#msg_procedure_contenu[name=?]", "msg_procedure[contenu]"
    end
  end
end
