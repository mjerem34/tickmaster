require 'rails_helper'
RSpec.describe ApplicationController, type: :controller do
  context 'tests for JSON' do
    before(:each) do
      request.accept = "application/json"
    end
    context 'when an user is connected' do

    end
    context 'when no user connected' do

    end
  end
  context 'tests for HTML' do

  end
  context 'general tests' do
    # describe 'ApplicationController#verifRight' do
    #   it "should return true if the current_user have the right" do
    #     current_user = create(:admin)
    #     expect(verifRight("view_index_users")).to eq(true)
    #   end
    #   it "should return false if the current_user have not the right" do
    #     @user = create(:user)
    #     sign_in @user
    #     expect(verifRight("view_index_users")).to eq(false)
    #   end
    # end
  end
end
