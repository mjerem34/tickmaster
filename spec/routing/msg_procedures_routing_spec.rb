require "rails_helper"

RSpec.describe MsgProceduresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/msg_procedures").to route_to("msg_procedures#index")
    end

    it "routes to #new" do
      expect(:get => "/msg_procedures/new").to route_to("msg_procedures#new")
    end

    it "routes to #show" do
      expect(:get => "/msg_procedures/1").to route_to("msg_procedures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/msg_procedures/1/edit").to route_to("msg_procedures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/msg_procedures").to route_to("msg_procedures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/msg_procedures/1").to route_to("msg_procedures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/msg_procedures/1").to route_to("msg_procedures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/msg_procedures/1").to route_to("msg_procedures#destroy", :id => "1")
    end

  end
end
