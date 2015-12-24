require 'rails_helper'

RSpec.describe IncidentsController, type: :controller do
  before :each do
      @incident = Incident.create(title: "test", content:"buighuihbu", category_id: 1, sous_category_id: 1)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    it "returns http success" do
      category = Category.create(name: 'test')
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: @incident.id
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      get :show, id: @incident.id
      expect(response).to have_http_status(:success)
    end
  end
end
