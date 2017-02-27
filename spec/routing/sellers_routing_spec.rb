require "rails_helper"

RSpec.describe SellersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sellers").to route_to("sellers#index")
    end

    it "routes to #new" do
      expect(:get => "/sellers/new").to route_to("sellers#new")
    end

    it "routes to #show" do
      expect(:get => "/sellers/1").to route_to("sellers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sellers/1/edit").to route_to("sellers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sellers").to route_to("sellers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sellers/1").to route_to("sellers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sellers/1").to route_to("sellers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sellers/1").to route_to("sellers#destroy", :id => "1")
    end

  end
end
