require "rails_helper"

RSpec.describe SpecsTypesMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/specs_types_materials").to route_to("specs_types_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/specs_types_materials/new").to route_to("specs_types_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/specs_types_materials/1").to route_to("specs_types_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/specs_types_materials/1/edit").to route_to("specs_types_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/specs_types_materials").to route_to("specs_types_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/specs_types_materials/1").to route_to("specs_types_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/specs_types_materials/1").to route_to("specs_types_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/specs_types_materials/1").to route_to("specs_types_materials#destroy", :id => "1")
    end

  end
end
