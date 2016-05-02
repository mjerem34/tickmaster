require 'rails_helper'

RSpec.describe "msg_procedures/edit", type: :view do
  before(:each) do
    @msg_procedure = assign(:msg_procedure, MsgProcedure.create!(
      :id_procedures => 1,
      :contenu => "MyText"
    ))
  end

  it "renders the edit msg_procedure form" do
    render

    assert_select "form[action=?][method=?]", msg_procedure_path(@msg_procedure), "post" do

      assert_select "input#msg_procedure_id_procedures[name=?]", "msg_procedure[id_procedures]"

      assert_select "textarea#msg_procedure_contenu[name=?]", "msg_procedure[contenu]"
    end
  end
end
