require "rails_helper"

RSpec.describe FieldSellersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/field_sellers").to route_to("field_sellers#index")
    end

    it "routes to #new" do
      expect(:get => "/field_sellers/new").to route_to("field_sellers#new")
    end

    it "routes to #show" do
      expect(:get => "/field_sellers/1").to route_to("field_sellers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/field_sellers/1/edit").to route_to("field_sellers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/field_sellers").to route_to("field_sellers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/field_sellers/1").to route_to("field_sellers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/field_sellers/1").to route_to("field_sellers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/field_sellers/1").to route_to("field_sellers#destroy", :id => "1")
    end

  end
end
