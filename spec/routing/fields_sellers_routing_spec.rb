require "rails_helper"

RSpec.describe FieldsSellersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fields_sellers").to route_to("fields_sellers#index")
    end

    it "routes to #new" do
      expect(:get => "/fields_sellers/new").to route_to("fields_sellers#new")
    end

    it "routes to #show" do
      expect(:get => "/fields_sellers/1").to route_to("fields_sellers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fields_sellers/1/edit").to route_to("fields_sellers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fields_sellers").to route_to("fields_sellers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fields_sellers/1").to route_to("fields_sellers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fields_sellers/1").to route_to("fields_sellers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fields_sellers/1").to route_to("fields_sellers#destroy", :id => "1")
    end

  end
end
