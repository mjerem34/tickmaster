require 'rails_helper'
RSpec.describe AgenciesController, type: :controller do
  before { @agency = create(:agency) }
  describe 'JSON' do
    before { request.accept = 'application/json' }
    it 'should content-type include app/json' do
      get :index

      expect(response.header['Content-Type']).to eq('application/json; charset=utf-8')
    end
    context 'not connected' do
      describe '#index' do
        it 'should render status unauthorized' do
          get :index

          expect(response.status).to eq 401
        end
      end
      describe '#ping' do
        it 'should render status unauthorized' do
          get :ping

          expect(response.status).to eq 401
        end
      end
      describe '#doPing' do
        it 'should render status unauthorized' do
          get :do_ping, host: '8.8.8.8'

          expect(response.status).to eq 401
        end
      end
      describe '#show' do
        it 'should render status unauthorized' do
          agency = create(:agency)
          get :show, id: agency.id

          expect(response.status).to eq 401
        end
      end
      describe '#new' do
        it 'should render status unauthorized' do
          get :new

          expect(response.status).to eq 401
        end
      end
      describe '#edit' do
        it 'should render status unauthorized' do
          get :edit, id: @agency.id

          expect(response.status).to eq 401
        end
      end
      describe '#create' do
        it 'should render status unauthorized' do
          post :create, agency: attributes_for(:agency)
          expect(response.status).to eq 401
          # expect(response.status).to eq 401
        end
      end
      describe '#update' do
        it 'should render status unauthorized' do
          put :update, id: @agency.id, agency: { name: 'nkin' }

          expect(response.status).to eq 401
        end
      end
      describe '#destroy' do
        it 'should render status unauthorized' do
          delete :destroy, id: @agency.id

          expect(response.status).to eq 401
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @admin = create(:admin, agency_id: @agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should return the agencies' do
            get :index

            expect(response.body).to eq Agency.all.to_json
          end
        end
        describe '#doPing' do
          it 'should return the result of a ping' do
            get :do_ping, host: '8.8.8.8'

            expect(response.body.to_i).to be > 0
          end
        end
        describe '#show' do
          it 'should return the detail of the agency' do
            get :show, id: @agency.id

            expect(response.body).to eq @agency.to_json
          end
        end
        describe '#create' do
          context 'valid attributes' do
            before { post :create, agency: { name: 'fef', ip_address: '8.8.8.8', data_agence_comp: { Code_postal: '34070', Ville: 'Montpellier' } } }
            it 'should create an agency' do
              expect(Agency.count).to eq 2
            end
            it 'should return the id of agency created' do
              agency = Agency.find_by_name('fef')
              expect(response.body).to eq agency.to_json
            end
            it 'should create the field_agency if not exists' do
              expect(FieldAgency.count).to eq 2
            end
          end
          context 'invalid attributes' do
            before { post :create, agency: { name: nil, ip_address: '8.8.8.8', data_agence_comp: { codePostal: '34070' } } }
            it 'should not create an agency if invalid' do
              expect(Agency.count).to eq 1
            end
            it 'should render error status' do
              expect(response.status).to eq 422
            end
          end
        end
        describe '#update' do
          context 'with valid attributes' do
            before { put :update, id: @agency.id, agency: { name: 'efsefsef', ip_address: '8.8.8.8', data_agence_comp: { codePostal: '34720' } } }
            it 'should edit the agency' do
              expect(Agency.find_by_name('efsefsef')).to eq @agency
            end
            it 'should return ok code' do
              expect(response.status).to eq 204
            end
          end
          context 'with invalid attributes' do
            before { put :update, id: @agency.id, agency: { name: 'fefef', ip_address: nil, data_agence_comp: { codePostal: '34720' } } }
            it 'should not edit the agency' do
              expect(Agency.find_by_name('efsefsef')).not_to eq @agency
            end
            it 'should return error status' do
              expect(response.status).to eq 422
            end
          end
        end
        describe '#destroy' do
          it 'should return' do
          end
        end
      end
      context "don't have the right" do
        before do
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
        end
        describe '#index' do
          it 'should render status unauthorized' do
            get :index

            expect(response.status).to eq 403
          end
        end
        describe '#ping' do
          it 'should render status unauthorized' do
            get :ping

            expect(response.status).to eq 403
          end
        end
        describe '#doPing' do
          it 'should render status unauthorized' do
            get :do_ping, host: '8.8.8.8'

            expect(response.status).to eq 403
          end
        end
        describe '#show' do
          it 'should render status unauthorized' do
            get :show, id: @agency.id

            expect(response.status).to eq 403
          end
        end
        describe '#new' do
          it 'should render status unauthorized' do
            get :new

            expect(response.status).to eq 403
          end
        end
        describe '#edit' do
          it 'should render status unauthorized' do
            get :edit, id: @agency.id

            expect(response.status).to eq 403
          end
        end
        describe '#create' do
          it 'should render status unauthorized' do
            post :create, agency: attributes_for(:agency)

            expect(response.status).to eq 403
          end
        end
        describe '#update' do
          it 'should render status unauthorized' do
            put :update, id: @agency.id, agency: { name: 'nkin', ip_address: '8.8.8.8' }

            expect(response.status).to eq 403
          end
        end
        describe '#destroy' do
          it 'should render status unauthorized' do
            delete :destroy, id: @agency.id

            expect(response.status).to eq 403
          end
        end
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    it 'should content-type include app/json' do
      get :index

      expect(response.header['Content-Type']).to eq('text/html; charset=utf-8')
    end
    context 'not connected' do
      describe '#index' do
        it 'should redirect to root_path' do
          get :index

          expect(response).to redirect_to root_path
        end
      end
      describe '#ping' do
        it 'should redirect to root_path' do
          get :ping

          expect(response).to redirect_to root_path
        end
      end
      describe '#show' do
        it 'should redirect to root_path' do
          get :show, id: @agency.id

          expect(response).to redirect_to root_path
        end
      end
      describe '#new' do
        it 'should redirect to root_path' do
          get :new

          expect(response).to redirect_to root_path
        end
      end
      describe '#edit' do
        it 'should redirect to root_path' do
          get :edit, id: @agency.id

          expect(response).to redirect_to root_path
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @admin = create(:admin, agency_id: @agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should render template :index' do
            get :index

            expect(response).to render_template :index
          end
        end
        describe '#ping' do
          it 'should render template :index' do
            get :ping

            expect(response).to render_template :ping
          end
        end
        describe '#show' do
          it 'should render template :index' do
            get :show, id: @agency.id

            expect(response).to redirect_to edit_agency_url(@agency)
          end
        end
        describe '#new' do
          it 'should render template :index' do
            get :new

            expect(response).to render_template :new
          end
        end
        describe '#edit' do
          it 'should render template :index' do
            get :edit, id: @agency.id

            expect(response).to render_template :edit
          end
        end
      end
      context "don't have the right" do
        before do
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
        end

        describe '#index' do
          it 'should redirect to root_path' do
            get :index

            expect(response).to redirect_to root_path
          end
        end
        describe '#ping' do
          it 'should redirect to root_path' do
            get :ping

            expect(response).to redirect_to root_path
          end
        end

        describe '#show' do
          it 'should redirect to root_path' do
            get :show, id: @agency.id

            expect(response).to redirect_to root_path
          end
        end
        describe '#new' do
          it 'should redirect to root_path' do
            get :new

            expect(response).to redirect_to root_path
          end
        end
        describe '#edit' do
          it 'should redirect to root_path' do
            get :edit, id: @agency.id

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
