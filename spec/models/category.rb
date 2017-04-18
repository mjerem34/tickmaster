require 'rails_helper'
RSpec.describe Category, type: :model do
  it "create the category" do
    expect(build(:category, name: "New category")).to be_valid
  end
  it "not create the categ if name is missing" do
    expect(build(:category, name: nil)).to_not be_valid
  end
  it "not create the categ if there is a double" do
    create(:category, name: "Test")

    expect(build(:category, name: "Test")).to_not be_valid
  end
  it "return sous_categ" do
    category = create(:category)
    create(:sous_category, category_id: category.id)

    sous_category = SousCategory.where(category_id: category.id)

    expect(category.sous_categories).to eq sous_category
  end
  it "create an sous_category called 'Autre' on save" do
    category = create(:category)
    expect(category.sous_categories.first.name).to eq "Autre"
  end
  it "return the incidents" do
    agency = create(:agency)
    user = create(:user, agency_id: agency.id)
    admin = create(:admin, agency_id: agency.id)
    c = create(:category)
    sc = create(:sous_category, category_id: c.id)
    incident = create(:incident, category_id: c.id, sous_category_id: sc.id, user_id: user.id, tech_id: admin.id)

  end
end
