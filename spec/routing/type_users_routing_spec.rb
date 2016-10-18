require "rails_helper"

RSpec.describe TypeUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/type_users").to route_to("type_users#index")
    end

    it "routes to #new" do
      expect(:get => "/type_users/new").to route_to("type_users#new")
    end

    it "routes to #show" do
      expect(:get => "/type_users/1").to route_to("type_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/type_users/1/edit").to route_to("type_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/type_users").to route_to("type_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/type_users/1").to route_to("type_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/type_users/1").to route_to("type_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/type_users/1").to route_to("type_users#destroy", :id => "1")
    end

  end
end
