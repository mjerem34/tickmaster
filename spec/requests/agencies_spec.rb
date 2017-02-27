require 'rails_helper'

RSpec.describe 'Agencies', type: :request do
  describe 'GET /agencies' do
    context 'when user is connected' do
      skip('TODO : Connexion')
      context 'when user have the right access' do
        it 'works! (now write some real specs)' do
          get agencies_path
          expect(response).to have_http_status(200)
        end
      end
      context 'when user do not have the right access' do
        get agencies_path
        expect(response).to have_http_status(302)
      end
    end
    context 'when user is not connected' do
      it 'should not render show template' do
        get agencies_path
        expect(response).to have_http_status(302)
      end
    end
  end
  describe 'GET /agencies/:id' do
    context 'when user is not connected' do
      it 'should not render show template' do
        get agencies_show_path(1)
        expect(response).to have_http_status(302)
      end
    end
  end
end
