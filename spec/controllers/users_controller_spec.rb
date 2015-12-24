require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
      @user = User.create(pseudo: 'foo', name: "bar", surname: 'baz', email: 'foo@bar.baz', tel: '0405060708', mobile: '0650458476')
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
      get :edit, id: @user.id
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :show, id: @user.id
      expect(response).to have_http_status(:success)
    end
  end

end
