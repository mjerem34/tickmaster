require 'rails_helper'
RSpec.describe SousCategory, type: :model do
  before { @category = create(:category) }

  it { expect(build(:sous_category, category_id: @category.id)).to be_valid }

  it { expect(build(:sous_category, category_id: nil)).not_to be_valid }

  it { expect(build(:sous_category, name: nil)).not_to be_valid }

  it { expect(build(:sous_category, name: SecureRandom.hex(127), category_id: @category.id)).to be_valid }

  it { expect(build(:sous_category, name: SecureRandom.hex(128), category_id: @category.id)).not_to be_valid }

  it { expect(build(:sous_category, lvl_urgence_max: nil)).not_to be_valid }

  # Can't have the same name AND the same category_id
  # Tested on 'Autre' because when create Category, an sous_category 'Autre'
  # Is created
  # Case insensitive
  it { expect(build(:sous_category, name: 'autre', category_id: @category.id)).not_to be_valid }

  it 'can have the same name if categ is not the same' do
    category = create(:category)
    build(:sous_category, name: 'test', category_id: @category.id)

    expect(build(:sous_category, name: 'test', category_id: category.id)).to be_valid
  end

  it 'should render the category' do
    sous_category = create(:sous_category, category_id: @category.id)

    expect(sous_category.category).to eq @category
  end

  it 'should render all the incidents' do
    agency = create(:agency)
    user = create(:user, agency_id: agency.id)
    admin = create(:admin, agency_id: agency.id)
    c = create(:category)
    sc = create(:sous_category, category_id: c.id)
    incident = create(:incident, lvl_urgence_user: 10, category_id: c.id, sous_category_id: sc.id, user_id: user.id, tech_id: admin.id)

    expect(sc.incidents).to eq [incident]
  end
end
