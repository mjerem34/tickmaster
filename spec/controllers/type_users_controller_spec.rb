require 'rails_helper'
RSpec.describe TypeUsersController, type: :controller do
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do
        it 'should show 401' do
          get :index

          expect(response.status).to eq 401
        end
      end
      describe '#show' do
        it 'should show 401' do
          get :show, id: 1

          expect(response.status).to eq 401
        end
      end
      describe '#create' do
        it 'should show 401' do
          post :create, type_user: attributes_for(:type_user)

          expect(response.status).to eq 401
        end
      end
      describe '#update' do
        it 'should show 401' do
          put :update, id: 1, type_user: attributes_for(:type_user)

          expect(response.status).to eq 401
        end
      end
      describe '#destroy' do
        it 'should show 401' do
          delete :destroy, id: 1

          expect(response.status).to eq 401
        end
      end
      describe '#toggle' do
        it 'should show 401' do
          patch :toggle, id: 1, right_id: 1, checked: false

          expect(response.status).to eq 401
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          @admin = create(:admin, agency_id: agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should show type_users' do
            get :index

            expect(response.body).to eq TypeUser.all.order('name').to_json
          end
        end
        describe '#show' do
          it 'should show type_users rights' do
            get :show, id: 1

            expect(response.body).to eq TypeUser.find(1).rights.to_json
          end
        end
        describe '#create' do
          it 'should create an type_user and assign rights' do
            post :create, type_user: attributes_for(:type_user, name: 'test'),
                          rights: Hash[1, true, 2, false]

            expect(response.status).to eq 201
            expect(TypeUser.last.name).to eq 'test'
            expect(TypeUserRight.last.type_user.name).to eq 'test'
          end
        end
        describe '#update' do
          it 'should edit the type_user' do
            type_user = create(:type_user)
            put :update, id: type_user.id, type_user: { name: 'test' }

            expect(TypeUser.last.name).to eq 'test'
            expect(response.status).to eq 204
          end
        end
        describe '#destroy' do
          it 'should destroy the type_user if no users binded' do
            type_user = create(:type_user)

            delete :destroy, id: type_user.id

            expect(response.status).to eq 204
            expect(TypeUser.exists?(type_user.id)).to be false
          end
          it 'should not destroy the type_user if users binded' do
            delete :destroy, id: 1

            expect(response.status).to eq 422
            expect(TypeUser.exists?(1)).to be true
          end
        end
        describe '#toggle' do
          it 'should toggle off the right' do
            patch :toggle, id: 1, right_id: 1, checked: false

            expect(response.status).to eq 204
            expect(TypeUserRight.find_by(right_id: 1, type_user_id: 1).value).to be false
          end
          it 'should toggle on the right' do
            patch :toggle, id: 23, right_id: 1, checked: true

            expect(response.status).to eq 204
            expect(TypeUserRight.find_by(right_id: 1, type_user_id: 23).value).to be true
          end
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          @user = create(:user, agency_id: agency.id)

          sign_in @user
        end
        describe '#index' do
          it 'should show 403' do
            get :index

            expect(response.status).to eq 403
          end
        end
        describe '#show' do
          it 'should show 403' do
            get :show, id: 1

            expect(response.status).to eq 403
          end
        end
        describe '#create' do
          it 'should show 403' do
            post :create, type_user: attributes_for(:type_user)

            expect(response.status).to eq 403
          end
        end
        describe '#update' do
          it 'should show 403' do
            put :update, id: 1, type_user: attributes_for(:type_user)

            expect(response.status).to eq 403
          end
        end
        describe '#destroy' do
          it 'should show 403' do
            delete :destroy, id: 1

            expect(response.status).to eq 403
          end
        end
        describe '#toggle' do
          it 'should show 403' do
            patch :toggle, id: 1, right_id: 1, checked: false

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
      describe '#show' do
        it 'should redirect to root_path' do
          get :show, id: 1

          expect(response).to redirect_to root_path
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          @admin = create(:admin, agency_id: agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should show type_users' do
            get :index

            expect(response).to render_template :index
          end
        end
        describe '#show' do
          it 'should show type_users.rights' do
            get :show, id: 1

            expect(response).to render_template :show
          end
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          @user = create(:user, agency_id: agency.id)

          sign_in @user
        end
        describe '#index' do
          it 'should redirect to root_path' do
            get :index

            expect(response).to redirect_to root_path
          end
        end
        describe '#show' do
          it 'should redirect to root_path' do
            get :show, id: 1

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
