require 'rails_helper'
RSpec.describe TypeMaterialsController, type: :controller do
  setup :activate_authlogic
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do
        it 'should render 401 and nothing' do
          get :index

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end

      describe '#create' do
        it 'should render 401 and do nothing' do
          post :create, type_material: attributes_for(:type_material)

          expect(response.status).to eq 401
          expect(TypeMaterial.count).to eq 0
        end
      end

      describe '#update' do
        it 'should render 401 and do nothing' do
          type_material = create(:type_material)

          put :update, id: type_material.id

          expect(response.status).to eq 401
          expect(type_material.name).to eq TypeMaterial.first.name
        end
      end

      describe '#destroy' do
        it 'should render 401 and do nothing' do
          type_material = create(:type_material)

          delete :destroy, id: type_material.id

          expect(response.status).to eq 401
          expect(TypeMaterial.find(type_material.id)).to eq type_material
        end
      end

      describe '#append_spec_type_material' do
        it 'should render 401 and do nothing' do
          type_material = create(:type_material)
          spec_type_material = create(:spec_type_material)

          post :append_spec_type_material, id: type_material.id,
                                           spec_type_material: {
                                             name: spec_type_material.name
                                           }

          expect(response.status).to eq 401
          expect(TypeMaterialSpecTypeMaterial.count).to eq 0
        end
      end

      describe '#unbind_spec_type_material' do
        it 'should render 401 and do nothing' do
          type_material = create(:type_material)
          spec_type_material = create(:spec_type_material)
          create(:type_material_spec_type_material,
                 type_material_id: type_material.id,
                 spec_type_material_id: spec_type_material.id)

          delete :unbind_spec_type_material, id: type_material.id,
                                             spec_type_material: {
                                               id: spec_type_material.id
                                             }

          expect(response.status).to eq 401
          expect(TypeMaterialSpecTypeMaterial.count).to eq 1
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
          it 'should render the list of type_materials' do
            create(:type_material)

            get :index

            expect(response.status).to eq 200
            expect(response.body).to eq TypeMaterial.all.to_json
          end
        end

        describe '#create' do
          it 'should create an type_material' do
            post :create, type_material: attributes_for(:type_material)

            expect(response.status).to eq 201
            expect(TypeMaterial.count).to eq 1
          end
        end
        describe '#update' do
          it 'should update an type_material' do
            type_material = create(:type_material)

            put :update, id: type_material.id,
                         type_material: { name: 'test' }

            expect(response.status).to eq 200
            expect(TypeMaterial.first.name).to eq 'test'
          end
        end

        describe '#destroy' do
          it 'should destroy the type_material' do
            type_material = create(:type_material)

            delete :destroy, id: type_material.id

            expect(response.status).to eq 200
            expect(TypeMaterial.count).to eq 0
          end

          it 'should not destroy if seller is binded' do
            type_material = create(:type_material)
            seller = create(:seller)
            create(:type_material_seller,
                   type_material_id: type_material.id,
                   seller_id: seller.id)

            delete :destroy, id: type_material.id

            expect(response.status).to eq 422
            expect(TypeMaterial.count).to eq 1
          end

          it 'should not destroy if material is binded' do
            type_material = create(:type_material)
            seller = create(:seller)
            detentor_type = create(:detentor_type)
            material = create(:material, type_material_id: type_material.id,
                                         seller_id: seller.id,
                                         detentor_type_id: detentor_type.id)

          end
        end
        describe '#append_spec_type_material' do
          it 'should append an spec_type_material if not yet appended' do
            type_material = create(:type_material)
            spec_type_material = create(:spec_type_material)

            post :append_spec_type_material, id: type_material.id,
                                             spec_type_material: {
                                               name: spec_type_material.name
                                             }

            expect(response.status).to eq 200
            expect(TypeMaterialSpecTypeMaterial.count).to eq 1
          end

          it 'should render "déjà lié" if already appended' do
            type_material = create(:type_material)
            spec_type_material = create(:spec_type_material)
            create(:type_material_spec_type_material,
                   type_material_id: type_material.id,
                   spec_type_material_id: spec_type_material.id)

            post :append_spec_type_material, id: type_material.id,
                                             spec_type_material: {
                                               name: spec_type_material.name
                                             }

            expect(response.status).to eq 422
            expect(TypeMaterialSpecTypeMaterial.count).to eq 1
          end
        end

        describe '#unbind_spec_type_material' do
          it 'should unbind the spec_type_material from type_material' do
            type_material = create(:type_material)
            spec_type_material = create(:spec_type_material)
            create(:type_material_spec_type_material,
                   type_material_id: type_material.id,
                   spec_type_material_id: spec_type_material.id)

            delete :unbind_spec_type_material, id: type_material.id,
                                               spec_type_material_id: spec_type_material.id

            expect(response.status).to eq 200
            expect(TypeMaterialSpecTypeMaterial.count).to eq 0
          end

          it 'should not unbind if an material is binded' do
            type_material = create(:type_material)
            spec_type_material = create(:spec_type_material)
            seller = create(:seller)
            detentor_type = create(:detentor_type)
            create(:type_material_spec_type_material,
                   type_material_id: type_material.id,
                   spec_type_material_id: spec_type_material.id)
            material = create(:material, type_material_id: type_material.id,
                                         seller_id: seller.id,
                                         detentor_type_id: detentor_type.id)
            spec_material = create(:spec_material, spec_type_material_id: spec_type_material.id)
            create(:spec_material_material, spec_material_id: spec_material.id, material_id: material.id)

            delete :unbind_spec_type_material, id: type_material.id,
                                               spec_type_material_id: spec_type_material.id

            expect(TypeMaterialSpecTypeMaterial.count).to eq 1
            expect(response.status).to eq 422
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
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)

            delete :destroy, id: type_material.id

            expect(response.status).to eq 403
            expect(TypeMaterial.find(type_material.id)).to eq type_material
          end
        end

        describe '#create' do
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)

            delete :destroy, id: type_material.id

            expect(response.status).to eq 403
            expect(TypeMaterial.find(type_material.id)).to eq type_material
          end
        end

        describe '#update' do
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)

            delete :destroy, id: type_material.id

            expect(response.status).to eq 403
            expect(TypeMaterial.find(type_material.id)).to eq type_material
          end
        end

        describe '#destroy' do
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)

            delete :destroy, id: type_material.id

            expect(response.status).to eq 403
            expect(TypeMaterial.find(type_material.id)).to eq type_material
          end
        end

        describe '#append_spec_type_material' do
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)
            spec_type_material = create(:spec_type_material)

            post :append_spec_type_material, id: type_material.id,
                                             spec_type_material: {
                                               name: spec_type_material.name
                                             }

            expect(response.status).to eq 403
            expect(TypeMaterialSpecTypeMaterial.count).to eq 0
          end
        end

        describe '#unbind_spec_type_material' do
          it 'should render 403 and do nothing' do
            type_material = create(:type_material)
            spec_type_material = create(:spec_type_material)
            create(:type_material_spec_type_material,
                   type_material_id: type_material.id,
                   spec_type_material_id: spec_type_material.id)

            delete :unbind_spec_type_material, id: type_material.id,
                                               spec_type_material_id: spec_type_material.id

            expect(response.status).to eq 403
            expect(TypeMaterialSpecTypeMaterial.count).to eq 1
          end
        end
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
      describe '#index' do
        it 'should render 302' do
          get :index

          expect(response.status).to eq 302
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
          it 'should render 200 and template' do
            get :index

            expect(response.status).to eq 200
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
          it 'should render 302 and redirect' do
            get :index

            expect(response.status).to eq 302
            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
