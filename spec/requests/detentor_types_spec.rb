require 'rails_helper'

RSpec.describe "DetentorTypes", type: :request do
  describe "GET /detentor_types" do
    it "works! (now write some real specs)" do
      get detentor_types_path
      expect(response).to have_http_status(200)
    end
  end
end
