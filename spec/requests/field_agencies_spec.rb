require 'rails_helper'

RSpec.describe "FieldAgencies", type: :request do
  describe "GET /field_agencies" do
    it "works! (now write some real specs)" do
      get field_agencies_path
      expect(response).to have_http_status(200)
    end
  end
end
