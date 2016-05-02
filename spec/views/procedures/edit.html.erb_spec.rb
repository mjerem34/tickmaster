require 'rails_helper'

RSpec.describe "procedures/edit", type: :view do
  before(:each) do
    @procedure = assign(:procedure, Procedure.create!(
      :nom => "MyString",
      :contenu => "MyText",
      :resolution => "MyText",
      :category_id => 1,
      :sous_category_id => 1
    ))
  end

  it "renders the edit procedure form" do
    render

    assert_select "form[action=?][method=?]", procedure_path(@procedure), "post" do

      assert_select "input#procedure_nom[name=?]", "procedure[nom]"

      assert_select "textarea#procedure_contenu[name=?]", "procedure[contenu]"

      assert_select "textarea#procedure_resolution[name=?]", "procedure[resolution]"

      assert_select "input#procedure_category_id[name=?]", "procedure[category_id]"

      assert_select "input#procedure_sous_category_id[name=?]", "procedure[sous_category_id]"
    end
  end
end
