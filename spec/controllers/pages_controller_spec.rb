require 'rails_helper'
RSpec.describe PagesController, type: :controller do
  setup :activate_authlogic
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
      describe '#home' do
        it 'should redirect_to login page' do
          get :home

          expect(response).to redirect_to new_session_path
        end
      end
    end
  end
  context 'connected' do
    before do
      agency = create(:agency)

      @user = create(:user, agency_id: agency.id)
      login @user
    end
    describe '#home' do
      it 'should redirect_to user page' do
        get :home

        expect(response).to redirect_to @user
      end
    end
  end
end
