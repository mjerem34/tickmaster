require "rails_helper"

RSpec.describe DetentorTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/detentor_types").to route_to("detentor_types#index")
    end

    it "routes to #new" do
      expect(:get => "/detentor_types/new").to route_to("detentor_types#new")
    end

    it "routes to #show" do
      expect(:get => "/detentor_types/1").to route_to("detentor_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/detentor_types/1/edit").to route_to("detentor_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/detentor_types").to route_to("detentor_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/detentor_types/1").to route_to("detentor_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/detentor_types/1").to route_to("detentor_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/detentor_types/1").to route_to("detentor_types#destroy", :id => "1")
    end

  end
end
