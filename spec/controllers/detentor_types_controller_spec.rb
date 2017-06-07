require 'rails_helper'
RSpec.describe DetentorTypesController, type: :controller do
  setup :activate_authlogic
  before { @detentor_type = create(:detentor_type) }
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do
        it 'should render 401 and display nothing' do
          get :index

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          @admin = create(:admin, agency_id: agency.id)

          login @admin
        end
        describe '#index' do
          it 'should display the detentor_types' do
            get :index

            expect(response.body).to eq [@detentor_type].to_json
          end
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          @user = create(:user, agency_id: agency.id)

          login @user
        end
        describe '#index' do
          it 'should respond 403 and display nothing' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
      describe '#index' do
        it 'should redirect_to root_path' do
          get :index

          expect(response).to redirect_to root_path
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          @admin = create(:admin, agency_id: agency.id)

          login @admin
        end
        describe '#index' do
          it 'should show template' do
            get :index

            expect(response).to render_template :index
          end
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          @user = create(:user, agency_id: agency.id)

          login @user
        end
        describe '#index' do
          it 'should redirect_to root_path' do
            get :index

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
