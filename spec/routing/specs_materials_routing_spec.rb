require "rails_helper"

RSpec.describe SpecMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spec_materials").to route_to("spec_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/spec_materials/new").to route_to("spec_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/spec_materials/1").to route_to("spec_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spec_materials/1/edit").to route_to("spec_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spec_materials").to route_to("spec_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spec_materials/1").to route_to("spec_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spec_materials/1").to route_to("spec_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spec_materials/1").to route_to("spec_materials#destroy", :id => "1")
    end

  end
end
