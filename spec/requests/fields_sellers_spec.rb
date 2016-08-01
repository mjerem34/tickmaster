require 'rails_helper'

RSpec.describe "FieldsSellers", type: :request do
  describe "GET /fields_sellers" do
    it "works! (now write some real specs)" do
      get fields_sellers_path
      expect(response).to have_http_status(200)
    end
  end
end
