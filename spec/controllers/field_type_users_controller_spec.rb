require 'rails_helper'
RSpec.describe FieldTypeUsersController, type: :controller do
  setup :activate_authlogic
  before do
    @agency = create(:agency)
    @field_type_user = create(:field_type_user)
    @type_user_binded = create(:type_user)
    create(:field_type_user_type_user,
           type_user_id: @type_user_binded.id,
           field_type_user_id: @field_type_user.id)
  end
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
      describe '#create' do
        it 'should render 401 and display nothing' do
          post :create, attributes_for(:field_type_user)

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#update' do
        it 'should render 401 and display nothing' do
          put :update, id: @field_type_user.id,
                       field_type_user: { name: 'test' }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#destroy' do
        it 'should render 401 and display nothing' do
          delete :destroy, id: @field_type_user.id

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @admin = create(:admin, agency_id: @agency.id)

          login @admin
        end
        describe '#index' do
          it 'should render field_agencies' do
            get :index

            expect(response.body).to eq [@field_type_user].to_json
          end
        end
        describe '#create' do
          it 'should create and return 201 and id' do
            post :create, field_type_user: attributes_for(:field_type_user)

            expect(response.status).to eq 201
            expect(response.body).to eq FieldTypeUser.last.id.to_s
            expect(FieldTypeUser.count).to eq 2
          end
          it 'should not create with invalid params' do
            post :create, field_type_user: { name: nil }

            expect(response.status).to eq 422
            expect(FieldTypeUser.count).to eq 1
          end
        end
        describe '#update' do
          it 'should update' do
            put :update, id: @field_type_user.id,
                         field_type_user: { name: 'test' }

            expect(FieldTypeUser.first.name).to eq 'test'
          end
          it 'should not update with invalid params' do
            put :update, id: @field_type_user.id, field_type_user: { name: nil }

            expect(FieldTypeUser.first.name).not_to eq nil
          end
        end

        describe '#destroy' do
          it 'should destroy the field_type_user' do
            field_type_user = create(:field_type_user)
            delete :destroy, id: field_type_user.id, force: false

            expect(FieldTypeUser.count).to eq 1
          end

          it 'should not destroy if users binded' do
            create(:field_user,
                   user_id: @admin.id,
                   field_type_user_id: @field_type_user.id)

            delete :destroy, id: @field_type_user.id, force: false

            expect(FieldTypeUser.count).to eq 1
            expect(response.status).to eq 422
          end

          it 'should destroy on force if users binded' do
            create(:field_user,
                   user_id: @admin.id,
                   field_type_user_id: @field_type_user.id)

            delete :destroy, id: @field_type_user.id, force: true

            expect(FieldTypeUser.count).to eq 0
            expect(response.status).to eq 204
          end
        end

      end
      context "don't have the right" do
        before do
          @user = create(:user, agency_id: @agency.id)

          login @user
        end
        describe '#index' do
          it 'should render 403 and display nothing' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#create' do
          it 'should render 403 and display nothing' do
            post :create, attributes_for(:field_type_user)

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#update' do
          it 'should render 403 and display nothing' do
            put :update, id: @field_type_user.id,
                         field_type_user: { name: 'test' }

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#destroy' do
          it 'should render 403 and display nothing' do
            delete :destroy, id: @field_type_user.id

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
      end
    end
  end
  describe 'HTML' do
    before do
      request.accept = 'text/html'
    end
    context 'not connected' do
      describe '#index' do
        it 'should redirect' do
          get :index

          expect(response).to redirect_to root_path
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @admin = create(:admin, agency_id: @agency.id)

          login @admin
          get :index
        end
        describe '#index' do
          it { expect(response).to render_template :index }
        end
      end
      context "don't have the right" do
        before do
          @user = create(:user, agency_id: @agency.id)

          login @user
          get :index
        end
        describe '#index' do
          it { expect(response).to redirect_to root_path }
        end
      end
    end
  end
end
