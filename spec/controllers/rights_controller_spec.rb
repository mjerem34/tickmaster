require 'rails_helper'

RSpec.describe RightsController, type: :controller do
  before :each do
      @right = Right.create(name: 'test',
            content: 'blabla',
            user: 1,
            tech: 1,
            super_tech: 1,
            disp: 1,
            admin: 1
)
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @right.id
      expect(response).to have_http_status(:success)
    end
  end
end
