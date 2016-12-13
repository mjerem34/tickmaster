require 'rails_helper'

RSpec.describe "SpecTypeMaterials", type: :request do
  describe "GET /spec_type_materials" do
    it "works! (now write some real specs)" do
      get spec_type_materials_path
      expect(response).to have_http_status(200)
    end
  end
end
