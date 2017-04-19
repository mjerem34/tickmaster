require 'rails_helper'
RSpec.describe Category, type: :model do
  it { expect(build(:category, name: "New category")).to be_valid }

  it { expect(build(:category, name: nil)).not_to be_valid }

  it { expect(build(:category, name: SecureRandom.hex(128))).not_to be_valid }

  it { expect(build(:category, name: SecureRandom.hex(127))).to be_valid }

  context "if categ is created" do
    before { @category = create(:category) }

    it { expect(build(:category, name: @category.name)).not_to be_valid }

    it "return sous_categ" do
      create(:sous_category, category_id: @category.id)

      sous_category = SousCategory.where(category_id: @category.id)

      expect(@category.sous_categories).to eq sous_category
    end

    it "create an sous_category called 'Autre' on save" do
      @category = create(:category)

      expect(@category.sous_categories.first.name).to eq "Autre"
    end

    it "return the incidents" do
      agency = create(:agency)
      user = create(:user, agency_id: agency.id)
      admin = create(:admin, agency_id: agency.id)
      sc = create(:sous_category, category_id: @category.id)
      incident = create(:incident, category_id: @category.id, lvl_urgence_user: 10, sous_category_id: sc.id, user_id: user.id, tech_id: admin.id)

      expect(@category.incidents).to eq [incident]
    end
  end
end
