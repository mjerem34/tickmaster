require "rails_helper"

RSpec.describe SpecTypeMaterialsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spec_type_materials").to route_to("spec_type_materials#index")
    end

    it "routes to #new" do
      expect(:get => "/spec_type_materials/new").to route_to("spec_type_materials#new")
    end

    it "routes to #show" do
      expect(:get => "/spec_type_materials/1").to route_to("spec_type_materials#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spec_type_materials/1/edit").to route_to("spec_type_materials#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spec_type_materials").to route_to("spec_type_materials#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/spec_type_materials/1").to route_to("spec_type_materials#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/spec_type_materials/1").to route_to("spec_type_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spec_type_materials/1").to route_to("spec_type_materials#destroy", :id => "1")
    end

  end
end
