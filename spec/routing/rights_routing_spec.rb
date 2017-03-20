require "rails_helper"

RSpec.describe RightsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rights").to route_to("rights#index")
    end

    it "routes to #new" do
      expect(:get => "/rights/new").to route_to("rights#new")
    end

    it "routes to #show" do
      expect(:get => "/rights/1").to route_to("rights#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rights/1/edit").to route_to("rights#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rights").to route_to("rights#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rights/1").to route_to("rights#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rights/1").to route_to("rights#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rights/1").to route_to("rights#destroy", :id => "1")
    end

  end
end
