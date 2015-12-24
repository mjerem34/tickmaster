require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before :each do
      @category = Category.create(name: "test")
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
      get :edit, id: @category.id
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :show, id: @category.id
      expect(response).to have_http_status(:success)
    end
  end
end
