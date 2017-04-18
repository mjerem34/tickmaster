require 'rails_helper'
RSpec.describe Update, type: :model do
  it { expect(build(:update)).to be_valid }

  it { expect(build(:update, changesMade: nil)).not_to be_valid }

  it "return the changes" do
    update = create(:update)

    expect(update.changesMade).not_to be_nil
  end
end
