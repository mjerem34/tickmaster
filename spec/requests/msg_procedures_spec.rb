require 'rails_helper'

RSpec.describe "MsgProcedures", type: :request do
  describe "GET /msg_procedures" do
    it "works! (now write some real specs)" do
      get msg_procedures_path
      expect(response).to have_http_status(200)
    end
  end
end
