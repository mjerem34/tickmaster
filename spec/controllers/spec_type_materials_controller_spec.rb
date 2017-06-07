require 'rails_helper'
RSpec.describe SpecTypeMaterialsController, type: :controller do
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
          post :create, spec_type_material: attributes_for(:spec_type_material)

          expect(response.status).to eq 401
          expect(SpecTypeMaterial.count).to eq 0
        end
      end
      describe '#update' do
        it 'should render 401 and do nothing' do
          spec_type_material = create(:spec_type_material)

          put :update, id: spec_type_material.id

          expect(response.status).to eq 401
          expect(spec_type_material.name).to eq SpecTypeMaterial.first.name
        end
      end
      describe '#destroy' do
        it 'should render 401 and do nothing' do
          spec_type_material = create(:spec_type_material)

          delete :destroy, id: spec_type_material.id

          expect(response.status).to eq 401
          expect(SpecTypeMaterial
          .find(spec_type_material.id)).to eq spec_type_material
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
          it 'should show the list of spec_type_materials' do
            create(:spec_type_material)

            get :index

            expect(response.body).to eq SpecTypeMaterial.all.to_json
          end
        end
        describe '#create' do
          it 'should create an spec_type_material' do
            post :create,
                 spec_type_material: attributes_for(:spec_type_material)

            expect(response.status).to eq 201
            expect(SpecTypeMaterial.count).to eq 1
          end
        end
        describe '#update' do
          it 'should update an spec_type_material' do
            spec_type_material = create(:spec_type_material)

            put :update, id: spec_type_material.id,
                         spec_type_material: { name: 'test' }

            expect(response.status).to eq 200
            expect(SpecTypeMaterial.first.name).to eq 'test'
          end
        end
        describe '#destroy' do
          it 'should destroy an spec_type_material' do
            spec_type_material = create(:spec_type_material)

            delete :destroy, id: spec_type_material.id

            expect(response.status).to eq 200
            expect(SpecTypeMaterial.count).to eq 0
          end
          it 'should not destroy an spec_type_material binded tpec_material' do
            spec_type_material = create(:spec_type_material)
            create(:spec_material, spec_type_material_id: spec_type_material.id)

            delete :destroy, id: spec_type_material.id

            expect(response.status).to eq 422
            expect(SpecTypeMaterial.count).to eq 1
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
          it 'should render 403 and nothing' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#create' do
          it 'should render 403 and do nothing' do
            post :create,
                 spec_type_material: attributes_for(:spec_type_material)

            expect(response.status).to eq 403
            expect(SpecTypeMaterial.count).to eq 0
          end
        end
        describe '#update' do
          it 'should render 403 and do nothing' do
            spec_type_material = create(:spec_type_material)

            put :update, id: spec_type_material.id

            expect(response.status).to eq 403
            expect(spec_type_material.name).to eq SpecTypeMaterial.first.name
          end
        end
        describe '#destroy' do
          it 'should render 403 and do nothing' do
            spec_type_material = create(:spec_type_material)

            delete :destroy, id: spec_type_material.id

            expect(response.status).to eq 403
            expect(SpecTypeMaterial.find(spec_type_material.id))
              .to eq spec_type_material
          end
        end
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
      describe '#index' do
        it 'should render 302 and nothing' do
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
          it 'should render index template' do
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
          it 'should render 302 and nothing' do
            get :index

            expect(response.status).to eq 302
            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
