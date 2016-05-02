require 'rails_helper'

RSpec.describe "procedures/show", type: :view do
  before(:each) do
    @procedure = assign(:procedure, Procedure.create!(
      :nom => "Nom",
      :contenu => "MyText",
      :resolution => "MyText",
      :category_id => 1,
      :sous_category_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
