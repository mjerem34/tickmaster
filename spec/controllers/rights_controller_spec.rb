require 'rails_helper'
RSpec.describe RightsController, type: :controller do
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do
        it 'should render status unauthorized' do
          get :index

          expect(response.status).to eq 401
        end
      end
      describe '#show' do
        it 'should render status unauthorized' do
          get :show, id: 1

          expect(response.status).to eq 401
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @agency = create(:agency)
          @admin = create(:admin, agency_id: @agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should show all the rights names' do
            get :index

            expect(response.body).to eq Right.all.to_json
          end
        end
        describe '#show' do
          it 'should show the type_users associated' do
            get :show, id: 1

            expect(response.body).to eq Right.first.type_user_rights.to_json
          end
        end
      end
      context "don't have the right" do
        before do
          @agency = create(:agency)
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
        end
        describe '#index' do
          it 'should render status unauthorized' do
            get :index

            expect(response.status).to eq 403
          end
        end
        describe '#show' do
          it 'should render status unauthorized' do
            get :show, id: 1

            expect(response.status).to eq 403
          end
        end
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
      describe '#index' do
        it 'should redirect to root_path' do
          get :index

          expect(response).to redirect_to root_path
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @agency = create(:agency)
          @admin = create(:admin, agency_id: @agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should redirect to root_path' do
            get :index

            expect(response).to render_template :index
          end
        end
        describe '#show' do
          it 'should redirect to root_path' do
            get :show, id: 1
            
            expect(response).to redirect_to rights_path
          end
        end
      end
      context "don't have the right" do
        before do
          @agency = create(:agency)
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
        end

        describe '#index' do
          it 'should redirect to root_path' do
            get :index

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
