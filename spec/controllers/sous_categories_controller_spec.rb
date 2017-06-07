require 'rails_helper'
RSpec.describe SousCategoriesController, type: :controller do
  setup :activate_authlogic
  before do
    # When we create an category
    # An sous_category called 'Autre' is created
    @category = create(:category)
    @sous_category = create(:sous_category, category_id: @category.id)
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
          get :show, id: @sous_category.id

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      describe '#create' do
        it 'should render 401 and show nothing' do
          post :create,
               sous_category:
               attributes_for(:sous_category, category_id: @category.id)

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(SousCategory.count).to eq 2
        end
      end
      describe '#update' do
        it 'should render 401 and show nothing' do
          put :update, id: @sous_category.id, sous_category: {
            name: 'test'
          }

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(SousCategory.last.name).to eq @sous_category.name
        end
      end
      describe '#destroy' do
        it 'should render 401 and show nothing' do
          delete :destroy, id: @sous_category.id

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
          expect(SousCategory.count).to eq 2
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          admin = create(:admin, agency_id: agency.id)

          login admin
        end
        describe '#index' do
          it 'should show the list of sous_categories' do
            get :index

            expect(response.status).to eq 200
            expect(response.body).to eq SousCategory.all.to_json
          end
        end
        describe '#show' do
          it 'should show the sous_category' do
            get :show, id: @sous_category.id

            expect(response.status).to eq 200
            expect(response.body).to eq @sous_category.to_json
          end
        end
        describe '#create' do
          it 'should create an sous_category' do
            post :create,
                 sous_category: attributes_for(
                   :sous_category, category_id: @category.id
                 )

            expect(response.status).to eq 201
            expect(response.body).to eq SousCategory.last.id.to_json
            expect(SousCategory.count).to eq 3
          end
        end
        describe '#update' do
          it 'should update an sous_category' do
            put :update, id: @sous_category.id,
                         sous_category: {
                           name: 'test'
                         }

            expect(response.status).to eq 200
            expect(response.body).to eq 'null'
            expect(SousCategory.last.name).to eq 'test'
          end
        end
        describe '#destroy' do
          it 'should destroy an sous_category' do
            delete :destroy, id: @sous_category.id

            expect(response.status).to eq 200
            expect(response.body).to eq 'null'
            expect(SousCategory.count).to eq 1
          end
        end
      end
      context "don't have the right" do
        before do
          agency = create(:agency)
          user = create(:user, agency_id: agency.id)

          login user
        end
        describe '#index' do
          it 'should render 403 and show nothing' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#show' do
          it 'should render 403 and show nothing' do
            get :show, id: @sous_category.id

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#create' do
          it 'should render 403 and show nothing' do
            post :create,
                 sous_category:
                 attributes_for(:sous_category, category_id: @category.id)

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(SousCategory.count).to eq 2
          end
        end
        describe '#update' do
          it 'should render 403 and show nothing' do
            put :update, id: @sous_category.id, sous_category: {
              name: 'test'
            }

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(SousCategory.last.name).to eq @sous_category.name
          end
        end
        describe '#destroy' do
          it 'should render 403 and show nothing' do
            delete :destroy, id: @sous_category.id

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
            expect(SousCategory.count).to eq 2
          end
        end
      end
    end
  end
end
