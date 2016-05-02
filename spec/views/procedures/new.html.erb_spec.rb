require 'rails_helper'

RSpec.describe "procedures/new", type: :view do
  before(:each) do
    assign(:procedure, Procedure.new(
      :nom => "MyString",
      :contenu => "MyText",
      :resolution => "MyText",
      :category_id => 1,
      :sous_category_id => 1
    ))
  end

  it "renders new procedure form" do
    render

    assert_select "form[action=?][method=?]", procedures_path, "post" do

      assert_select "input#procedure_nom[name=?]", "procedure[nom]"

      assert_select "textarea#procedure_contenu[name=?]", "procedure[contenu]"

      assert_select "textarea#procedure_resolution[name=?]", "procedure[resolution]"

      assert_select "input#procedure_category_id[name=?]", "procedure[category_id]"

      assert_select "input#procedure_sous_category_id[name=?]", "procedure[sous_category_id]"
    end
  end
end
