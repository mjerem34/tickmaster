require "rails_helper"

RSpec.describe TechesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/teches").to route_to("teches#index")
    end

    it "routes to #new" do
      expect(:get => "/teches/new").to route_to("teches#new")
    end

    it "routes to #show" do
      expect(:get => "/teches/1").to route_to("teches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/teches/1/edit").to route_to("teches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/teches").to route_to("teches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/teches/1").to route_to("teches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/teches/1").to route_to("teches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/teches/1").to route_to("teches#destroy", :id => "1")
    end

  end
end
