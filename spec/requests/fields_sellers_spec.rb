require 'rails_helper'

RSpec.describe "FieldSellers", type: :request do
  describe "GET /field_sellers" do
    it "works! (now write some real specs)" do
      get field_sellers_path
      expect(response).to have_http_status(200)
    end
  end
end
