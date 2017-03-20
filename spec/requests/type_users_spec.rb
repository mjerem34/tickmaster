require 'rails_helper'

RSpec.describe "TypeUsers", type: :request do
  describe "GET /type_users" do
    it "works! (now write some real specs)" do
      get type_users_path
      expect(response).to have_http_status(200)
    end
  end
end
