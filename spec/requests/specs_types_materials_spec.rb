require 'rails_helper'

RSpec.describe "SpecsTypesMaterials", type: :request do
  describe "GET /specs_types_materials" do
    it "works! (now write some real specs)" do
      get specs_types_materials_path
      expect(response).to have_http_status(200)
    end
  end
end
