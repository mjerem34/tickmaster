require "rails_helper"

RSpec.describe FieldTypeUsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/field_type_users").to route_to("field_type_users#index")
    end

    it "routes to #new" do
      expect(:get => "/field_type_users/new").to route_to("field_type_users#new")
    end

    it "routes to #show" do
      expect(:get => "/field_type_users/1").to route_to("field_type_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/field_type_users/1/edit").to route_to("field_type_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/field_type_users").to route_to("field_type_users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/field_type_users/1").to route_to("field_type_users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/field_type_users/1").to route_to("field_type_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/field_type_users/1").to route_to("field_type_users#destroy", :id => "1")
    end

  end
end
