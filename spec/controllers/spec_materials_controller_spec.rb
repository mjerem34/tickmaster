require 'rails_helper'
RSpec.describe SpecMaterialsController, type: :controller do
  before do
    @spec_type_material = create(:spec_type_material)
    @spec_material = create(:spec_material,
                            spec_type_material_id: @spec_type_material.id)
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
      describe '#create' do
        it 'should render 401 and do nothing' do
          post :create,
               spec_material: {
                 spec_type_material_id: @spec_type_material.id,
                 spec_value: 'test'
               }

          expect(response.status).to eq 401
          expect(SpecMaterial.count).to eq 1
        end
      end
      describe '#update' do
        it 'should render 401 and do nothing' do
          put :update, id: @spec_material.id,
                       spec_material: { spec_value: 'test' }

          expect(response.status).to eq 401
          expect(SpecMaterial.first.spec_value).to eq @spec_material.spec_value
        end
      end
      describe '#destroy' do
        it 'should render 401 and do nothing' do
          delete :destroy, id: @spec_material.id

          expect(response.status).to eq 401
          expect(SpecMaterial.count).to eq 1
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          admin = create(:admin, agency_id: agency.id)

          sign_in admin
        end
        describe '#index' do
          it 'should render the list of spec_materials' do
            get :index

            expect(response.body).to eq SpecMaterial.all.to_json
          end
        end
        describe '#create' do
          it 'should create an spec_material' do
            post :create,
                 spec_material: {
                   spec_type_material_name: @spec_type_material.name,
                   spec_value: 'test'
                 }

            expect(response.status).to eq 201
            expect(response.body).to eq SpecMaterial.last.id.to_json
            expect(SpecMaterial.count).to eq 2
            expect(SpecMaterial.last.spec_value).to eq 'test'
          end

          it 'should create an spec_material and an spec_type_material if not exists' do
            post :create,
                 spec_material: {
                   spec_type_material_name: 'Test',
                   spec_value: 'test'
                 }

            expect(response.status).to eq 201
            expect(response.body).to eq SpecMaterial.last.id.to_json
            expect(SpecMaterial.count).to eq 2
            expect(SpecTypeMaterial.count).to eq 2
            expect(SpecTypeMaterial.last.name).to eq 'Test'
            expect(SpecMaterial.last.spec_type_material_id)
              .to eq SpecTypeMaterial.last.id
            expect(SpecMaterial.last.spec_value).to eq 'test'
          end

          it 'should not create if already exists the same' do
            post :create,
                 spec_material: {
                   spec_type_material_name: @spec_type_material.name,
                   spec_value: @spec_material.spec_value
                 }

            expect(response.status).to eq 422
            expect(SpecMaterial.count).to eq 1
          end
        end
        describe '#update' do
          it 'should update an spec_material' do
            put :update, id: @spec_material.id,
                         spec_material: {
                           spec_type_material_name: @spec_type_material.name,
                           spec_value: 'test'
                         }

            expect(response.status).to eq 200
            expect(SpecMaterial.last.spec_value).to eq 'test'
          end

          it 'should create an spec_material and an spec_type_material if not exists' do
            put :update, id: @spec_material.id,
                         spec_material: {
                           spec_type_material_name: 'Test',
                           spec_value: 'test'
                         }

            expect(response.status).to eq 200
            expect(response.body).to eq @spec_material.id.to_json
            expect(SpecTypeMaterial.count).to eq 2
            expect(SpecTypeMaterial.last.name).to eq 'Test'
            expect(SpecMaterial.last.spec_type_material_id)
              .to eq SpecTypeMaterial.last.id
            expect(SpecMaterial.last.spec_value).to eq 'test'
          end

          it 'should not update if already exists the same' do
            spec_material = create(:spec_material,
                                   spec_type_material_id: @spec_type_material.id)
            put :update, id: @spec_material.id,
                         spec_material: {
                           spec_type_material_name: @spec_type_material.name,
                           spec_value: spec_material.spec_value
                         }

            expect(response.status).to eq 422
            expect(SpecTypeMaterial.last.name).to eq @spec_type_material.name
            expect(SpecMaterial.find(@spec_material.id).spec_value)
              .to eq @spec_material.spec_value
          end
        end
        describe '#destroy' do
          it 'should destroy an spec_material' do
            delete :destroy, id: @spec_material.id

            expect(response.status).to eq 200
            expect(SpecMaterial.count).to eq 0
          end
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          user = create(:user, agency_id: agency.id)

          sign_in user
        end
        describe '#index' do
          it 'should render 403 and render nothing' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#create' do
          it 'should render 403 and render nothing' do
            post :create,
                 spec_material: {
                   spec_type_material_id: @spec_type_material.id,
                   spec_value: 'test'
                 }

            expect(response.status).to eq 403
            expect(SpecMaterial.count).to eq 1
          end
        end
        describe '#update' do
          it 'should render 403 and render nothing' do
            put :update, id: @spec_material.id,
                         spec_material: { spec_value: 'test' }

            expect(response.status).to eq 403
            expect(SpecMaterial.first.spec_value)
              .to eq @spec_material.spec_value
          end
        end
        describe '#destroy' do
          it 'should render 403 and do nothing' do
            delete :destroy, id: @spec_material.id

            expect(response.status).to eq 403
            expect(SpecMaterial.count).to eq 1
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
          admin = create(:admin, agency_id: agency.id)

          sign_in admin

          get :index
        end
        describe '#index' do
          it { expect(response).to render_template :index }
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          user = create(:user, agency_id: agency.id)

          sign_in user
          get :index
        end
        describe '#index' do
          it { expect(response).to redirect_to root_path }
        end
      end
    end
  end
end
