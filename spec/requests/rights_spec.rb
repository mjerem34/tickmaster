require 'rails_helper'

RSpec.describe "Rights", type: :request do
  describe "GET /rights" do
    it "works! (now write some real specs)" do
      get rights_path
      expect(response).to have_http_status(200)
    end
  end
end
