require 'rails_helper'

RSpec.describe "Teches", type: :request do
  describe "GET /teches" do
    it "works! (now write some real specs)" do
      get teches_path
      expect(response).to have_http_status(200)
    end
  end
end
