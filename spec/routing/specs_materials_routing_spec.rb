require "rails_helper"

RSpec.describe SpecsMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/specs_materials").to route_to("specs_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/specs_materials/new").to route_to("specs_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/specs_materials/1").to route_to("specs_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/specs_materials/1/edit").to route_to("specs_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/specs_materials").to route_to("specs_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/specs_materials/1").to route_to("specs_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/specs_materials/1").to route_to("specs_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/specs_materials/1").to route_to("specs_materials#destroy", :id => "1")
    end

  end
end
