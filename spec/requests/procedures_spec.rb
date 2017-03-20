require 'rails_helper'

RSpec.describe 'Procedures', type: :request do
  describe 'GET /procedures' do
    context 'when user is connected' do
      it 'works! (now write some real specs)' do
        # do the connection
        # get procedures_path
        # expect(response).to have_http_status(200)
        skip('i have to do the connection before')
      end
    end
    context 'when user is not connected' do
      it 'should not work' do
        get procedures_path
        expect(response).to_not have_http_status(300)
      end
    end
  end
end
