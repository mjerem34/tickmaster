require 'rails_helper'

RSpec.describe "FieldTypeUsers", type: :request do
  describe "GET /field_type_users" do
    it "works! (now write some real specs)" do
      get field_type_users_path
      expect(response).to have_http_status(200)
    end
  end
end
