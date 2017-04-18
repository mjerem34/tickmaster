require 'rails_helper'
RSpec.describe DetentorType, type: :model do
  it { expect(build(:detentor_type)).to be_valid }

  it { expect(build(:detentor_type, name: nil)).not_to be_valid }

  it "not valid if there is a double" do
    detentor_type = create(:detentor_type)
      expect(build(:detentor_type, name: detentor_type.name)).not_to be_valid
  end
  it "return materials"
end
