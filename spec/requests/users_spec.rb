require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    context 'when user is connected' do
      context 'when user have the right to visit index' do
        it 'works! (now write some real specs)' do
          # faire la connexion
          # get users_path
          # expect(response).to have_http_status(200)
          skip('i have to do the connection before')
        end
      end
      context "when user don't have the right" do
        it 'not work' do
          get users_path
          expect(response).to have_http_status(302)
        end
      end
    end
    context 'when user is not connected' do
      it 'not working' do
        get users_path
        expect(response).to have_http_status(302)
      end
    end
  end
end
