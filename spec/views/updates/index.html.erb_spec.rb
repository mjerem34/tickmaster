require 'rails_helper'

RSpec.describe "updates/index", type: :view do
  before(:each) do
    assign(:updates, [
      Update.create!(
        :changes => "Changes"
      ),
      Update.create!(
        :changes => "Changes"
      )
    ])
  end

  it "renders a list of updates" do
    render
    assert_select "tr>td", :text => "Changes".to_s, :count => 2
  end
end
