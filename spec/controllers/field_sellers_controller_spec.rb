require 'rails_helper'
RSpec.describe FieldSellersController, type: :controller do
  before do
    @agency = create(:agency)
    @field_seller = create(:field_seller)
    @seller_binded = create(:seller)
    create(:field_seller_seller, seller_id: @seller_binded.id,
                                 field_seller_id: @field_seller.id)
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
          post :create, attributes_for(:field_seller)

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#update' do
        it 'should render 401 and display nothing' do
          put :update, id: @field_seller.id, field_seller: { name: 'test' }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#destroy' do
        it 'should render 401 and display nothing' do
          delete :destroy, id: @field_seller.id

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
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
          it 'should render field_agencies' do
            get :index

            expect(response.body).to eq [@field_seller].to_json
          end
        end
        describe '#create' do
          it 'should create and return 201 and id' do
            post :create, field_seller: attributes_for(:field_seller)

            expect(response.status).to eq 201
            expect(response.body).to eq FieldSeller.last.id.to_s
            expect(FieldSeller.count).to eq 2
          end
          it 'should not create with invalid params' do
            post :create, field_seller: { name: nil }

            expect(response.status).to eq 422
            expect(FieldSeller.count).to eq 1
          end
        end
        describe '#update' do
          it 'should update' do
            put :update, id: @field_seller.id, field_seller: { name: 'test' }

            expect(FieldSeller.first.name).to eq 'test'
          end
          it 'should not update with invalid params' do
            put :update, id: @field_seller.id, field_seller: { name: nil }

            expect(FieldSeller.first.name).not_to eq nil
          end
        end
        describe '#destroy' do
          it 'should destroy the field_seller' do
            field_seller = create(:field_seller)
            delete :destroy, id: field_seller.id

            expect(FieldSeller.count).to eq 1
          end
          it 'should not destroy if agency binded' do
            delete :destroy, id: @field_seller.id

            expect(FieldSeller.count).to eq 1
            expect(response.status).to eq 422
          end
        end
      end
      context "don't have the right" do
        before do
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
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
            post :create, attributes_for(:field_seller)

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#update' do
          it 'should render 403 and display nothing' do
            put :update, id: @field_seller.id, field_seller: { name: 'test' }

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#destroy' do
          it 'should render 403 and display nothing' do
            delete :destroy, id: @field_seller.id

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

          sign_in @admin
          get :index
        end
        describe '#index' do
          it { expect(response).to render_template :index }
        end
      end
      context "don't have the right" do
        before do
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
          get :index
        end
        describe '#index' do
          it { expect(response).to redirect_to root_path }
        end
      end
    end
  end
end
