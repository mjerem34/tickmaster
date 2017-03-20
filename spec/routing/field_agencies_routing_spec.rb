require "rails_helper"

RSpec.describe FieldAgenciesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/field_agencies").to route_to("field_agencies#index")
    end

    it "routes to #new" do
      expect(:get => "/field_agencies/new").to route_to("field_agencies#new")
    end

    it "routes to #show" do
      expect(:get => "/field_agencies/1").to route_to("field_agencies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/field_agencies/1/edit").to route_to("field_agencies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/field_agencies").to route_to("field_agencies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/field_agencies/1").to route_to("field_agencies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/field_agencies/1").to route_to("field_agencies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/field_agencies/1").to route_to("field_agencies#destroy", :id => "1")
    end

  end
end
