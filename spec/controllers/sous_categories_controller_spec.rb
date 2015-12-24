require 'rails_helper'

RSpec.describe SousCategoriesController, type: :controller do
  before :each do
      @sous_cat = SousCategory.create(name: "test")
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
      get :edit, id: @sous_cat.id
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :show, id: @sous_cat.id
      expect(response).to have_http_status(:success)
    end
  end

end
