require 'rails_helper'
RSpec.describe SellersController, type: :controller do
  setup :activate_authlogic
  before do
    @seller = create(:seller)

    agency = create(:agency)
    @user = create(:user, agency_id: agency.id)
    @admin = create(:admin, agency_id: agency.id)
    logout @user
  end
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do
        it 'should render 401 and show nothing' do
          get :index

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#show' do
        it 'should render 401 and show nothing' do
          get :show, id: @seller.id

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#create' do
        it 'should render 401 and do nothing' do
          post :create, seller: attributes_for(:seller)

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(Seller.count).to eq 1
        end
      end
      describe '#update' do
        it 'should render 401 and do nothing' do
          put :update, id: @seller.id,
                       seller: { name: 'test' }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(Seller.last.name).to eq @seller.name
        end
      end
      describe '#destroy' do
        it 'should render 401 and do nothing' do
          delete :destroy, id: @seller.id

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(Seller.count).to eq 1
        end
      end
      describe '#bind_type_material' do
        it 'should render 401 and do nothing' do
          post :bind_type_material, id: @seller.id,
                                    type_material: {
                                      name: 'Test'
                                    }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(TypeMaterial.count).to eq 0
          expect(TypeMaterialSeller.count).to eq 0
        end
      end
      describe '#unbind_type_material' do
        it 'should render 401 and do nothing' do
          type_material = create(:type_material)
          create(:type_material_seller,
                 type_material_id: type_material.id,
                 seller_id: @seller.id)

          delete :unbind_type_material, id: @seller.id, type_material: {
            id: type_material.id
          }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(TypeMaterialSeller.count).to eq 1
        end
      end
      describe '#bind_field_seller' do
        it 'should render 401 and do nothing' do
          field_seller = create(:field_seller)

          post :bind_field_seller, id: @seller.id, field_seller: {
            id: field_seller.id
          }, content: 'test'

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(FieldSellerSeller.count).to eq 0
        end
      end
      describe '#update_field_seller' do
        it 'should render 401 and do nothing' do
          field_seller = create(:field_seller)

          create(:field_seller_seller,
                 seller_id: @seller.id,
                 field_seller_id: field_seller.id)

          put :update_field_seller, id: @seller.id, field_seller: {
            id: field_seller.id
          }, content: 'test'

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(FieldSellerSeller.count).to eq 1
        end
      end
      describe '#unbind_field_seller' do
        it 'should render 401 and do nothing' do
          field_seller = create(:field_seller)

          create(:field_seller_seller,
                 seller_id: @seller.id,
                 field_seller_id: field_seller.id)

          delete :unbind_field_seller,
                 id: @seller.id,
                 field_seller: {
                   id: field_seller.id
                 }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(FieldSellerSeller.count).to eq 1
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before { login @admin }
        describe '#index' do
          it 'should render 200 and show the list of sellers' do
            get :index

            expect(response.status).to eq 200
            expect(response.body).to eq Seller.all.to_json
          end
        end
        describe '#show' do
          it 'should render 200 and show the seller' do
            get :show, id: @seller.id

            expect(response.status).to eq 200
            expect(response.body).to eq Seller.first.to_json
          end
        end
        describe '#create' do
          it 'should render 201 and create an seller' do
            post :create, seller: attributes_for(:seller)

            expect(response.status).to eq 201
            expect(Seller.count).to eq 2
          end
        end
        describe '#update' do
          it 'should render 200 and update an seller' do
            put :update, id: @seller.id,
                         seller: { name: 'test' }

            expect(response.status).to eq 200
            expect(Seller.last.name).to eq 'test'
          end
        end
        describe '#destroy' do
          it 'should render 200 and destroy an seller' do
            delete :destroy, id: @seller.id

            expect(response.status).to eq 200
            expect(Seller.count).to eq 0
          end
        end
        describe '#bind_type_material' do
          it 'should render 200 and bind an type_material to the seller' do
            type_material = create(:type_material)
            post :bind_type_material, id: @seller.id,
                                      type_material: {
                                        name: type_material.name
                                      }

            expect(response.status).to eq 200
            expect(TypeMaterial.count).to eq 1
            expect(TypeMaterialSeller.count).to eq 1
          end
          it 'should create the type material if not exists' do
            post :bind_type_material, id: @seller.id,
                                      type_material: {
                                        name: 'Test'
                                      }

            expect(response.status).to eq 200
            expect(TypeMaterial.count).to eq 1
            expect(TypeMaterialSeller.count).to eq 1
          end
        end
        describe '#unbind_type_material' do
          it 'should render 200 and unbind the type_material to the seller' do
            type_material = create(:type_material)
            create(:type_material_seller,
                   type_material_id: type_material.id,
                   seller_id: @seller.id)

            delete :unbind_type_material, id: @seller.id, type_material: {
              id: type_material.id
            }

            expect(response.status).to eq 200
            expect(TypeMaterialSeller.count).to eq 0
          end
        end
        describe '#bind_field_seller' do
          it 'should render 200 and bind the field_seller to the seller' do
            field_seller = create(:field_seller)

            post :bind_field_seller, id: @seller.id, field_seller: {
              id: field_seller.id
            }, content: 'test'

            expect(response.status).to eq 200
            expect(FieldSellerSeller.count).to eq 1
            expect(FieldSellerSeller.first.content).to eq 'test'
          end
        end
        describe '#update_field_seller' do
          it 'should render 200 and update the field_seller binded to the seller' do
            field_seller = create(:field_seller)

            create(:field_seller_seller,
                   seller_id: @seller.id,
                   field_seller_id: field_seller.id)

            put :update_field_seller, id: @seller.id, field_seller: {
              id: field_seller.id
            }, content: 'test'

            expect(response.status).to eq 200
            expect(FieldSellerSeller.count).to eq 1
            expect(FieldSellerSeller.first.content).to eq 'test'
          end
        end
        describe '#unbind_field_seller' do
          it 'should render 200 and unbind the field_seller from the seller' do
            field_seller = create(:field_seller)

            create(:field_seller_seller,
                   seller_id: @seller.id,
                   field_seller_id: field_seller.id)

            delete :unbind_field_seller,
                   id: @seller.id,
                   field_seller: {
                     id: field_seller.id
                   }

            expect(response.status).to eq 200
            expect(FieldSellerSeller.count).to eq 0
          end
        end
      end
      context "don't have the right" do
        before { login @user }
        describe '#index' do
          it 'should render 403 and show nothing' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#show' do
          it 'should render 403 and show nothing' do
            get :show, id: @seller.id

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#create' do
          it 'should render 403 and do nothing' do
            post :create, seller: attributes_for(:seller)

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(Seller.count).to eq 1
          end
        end
        describe '#update' do
          it 'should render 403 and do nothing' do
            put :update, id: @seller.id,
                         seller: { name: 'test' }

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(Seller.last.name).to eq @seller.name
          end
        end
        describe '#destroy' do
          it 'should render 403 and do nothing' do
            delete :destroy, id: @seller.id

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(Seller.count).to eq 1
          end
        end
        describe '#bind_type_material' do
          it 'should render 403 and do nothing' do
            post :bind_type_material, id: @seller.id,
                                      type_material: {
                                        name: 'Test'
                                      }

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(TypeMaterial.count).to eq 0
            expect(TypeMaterialSeller.count).to eq 0
          end
        end
        describe '#unbind_type_material' do
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)

            delete :unbind_type_material, id: @seller.id, type_material: {
              id: type_material.id
            }

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#bind_field_seller' do
          it 'should render 403 and do nothing' do
            field_seller = create(:field_seller)

            post :bind_field_seller, id: @seller.id, field_seller: {
              id: field_seller.id
            }, content: 'test'

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#update_field_seller' do
          it 'should render 403 and do nothing' do
            field_seller = create(:field_seller)

            create(:field_seller_seller,
                   seller_id: @seller.id,
                   field_seller_id: field_seller.id)

            put :update_field_seller, id: @seller.id, field_seller: {
              id: field_seller.id
            }, content: 'test'

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#unbind_field_seller' do
          it 'should render 403 and do nothing' do
            field_seller = create(:field_seller)

            create(:field_seller_seller,
                   seller_id: @seller.id,
                   field_seller_id: field_seller.id)

            delete :unbind_field_seller,
                   id: @seller.id,
                   field_seller: {
                     id: field_seller.id
                   }
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
        before { login @admin }
        describe '#index' do
          it 'should render template' do
            get :index

            expect(response).to render_template :index
          end
        end
      end
      context "don't have the right" do
        before { login @user }
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
