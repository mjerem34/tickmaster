require 'rails_helper'
RSpec.describe CategoriesController, type: :controller do
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
        it 'should render 401' do
          post :create, attributes_for(:category)

          expect(response.status).to eq 401
          expect(response.body).to eq 'null'
        end
      end
      context 'category created' do
        before { @category = create(:category) }
        describe '#show' do
          it 'should render 401' do
            get :show, id: @category.id

            expect(response.status).to eq 401
            expect(response.body).to eq 'null'
          end
        end
        describe '#update' do
          it 'should render 401' do
            put :update, id: @category.id, category: { name: 'testa' }

            expect(response.status).to eq 401
            expect(response.body).to eq 'null'
          end
        end
        describe '#destroy' do
          it 'should render 401' do
            delete :destroy, id: @category.id

            expect(response.status).to eq 401
            expect(response.body).to eq 'null'
          end
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          agency = create(:agency)
          @admin = create(:admin, agency_id: agency.id)
          @category = create(:category)

          sign_in @admin
        end
        describe '#index' do
          it 'should render the list of the categories' do
            get :index
            puts Category.all.inspect
            expect(response.body).to eq [@category].to_json
          end
        end
        describe '#create' do
          it 'should create an category' do
            post :create, category: { name: 'efs' }

            expect(Category.count).to eq 2
            expect(response.status).to eq 201
            expect(response.body).to eq Category.second.id.to_s
          end
          it 'should error on invalid params' do
            post :create, category: { name: nil }

            expect(Category.count).to eq 1
            expect(response.status).to eq 422
          end
        end
        context 'category created' do
          describe '#show' do
            it 'should render the sous_categories of the category' do
              get :show, id: @category.id

              expect(response.body).to eq @category.sous_categories.to_json
            end
          end
          describe '#update' do
            it 'should update an category' do
              put :update, id: @category.id, category: { name: 'test' }

              expect(Category.first.name).to eq 'test'
            end
            it 'should error on invalid params' do
              put :update, id: @category.id, category: { name: nil }

              expect(response.status).to eq 422
              expect(Category.first.name).not_to eq nil
            end
          end
          describe '#destroy' do
            it 'should destroy an category' do
              delete :destroy, id: @category.id

              expect(Category.count).to eq 0
            end
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
          it 'should render 403' do
            get :index

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        describe '#create' do
          it 'should render 403' do
            post :create, attributes_for(:category)

            expect(response.status).to eq 403
            expect(response.body).to eq 'null'
          end
        end
        context 'category created' do
          before { @category = create(:category) }
          describe '#show' do
            it 'should render 403' do
              get :show, id: @category.id

              expect(response.status).to eq 403
              expect(response.body).to eq 'null'
            end
          end
          describe '#update' do
            it 'should render 403' do
              put :update, id: @category.id, category: { name: 'esfes' }

              expect(response.status).to eq 403
              expect(response.body).to eq 'null'
            end
          end
          describe '#destroy' do
            it 'should render 403' do
              delete :destroy, id: @category.id

              expect(response.status).to eq 403
              expect(response.body).to eq 'null'
            end
          end
        end
      end
    end
  end
  describe 'HTML' do
    before do
      request.accept = 'text/html'
      @category = create(:category)
    end
    context 'not connected' do
      describe '#index' do
        it 'should redirect to root_path' do
          get :index

          expect(response).to redirect_to root_path
        end
      end
      describe '#show' do
        it 'should redirect to root_path' do
          get :show, id: @category.id

          expect(response).to redirect_to root_path
        end
      end
      describe '#edit' do
        it 'should redirect to root_path' do
          get :edit, id: @category.id

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
          it 'should render index template' do
            get :index

            expect(response).to render_template :index
          end
        end
        describe '#show' do
          it 'should redirect to edit template' do
            get :show, id: @category.id

            expect(response).to redirect_to edit_category_url(@category)
          end
        end
        describe '#edit' do
          it 'should render edit template' do
            get :edit, id: @category.id

            expect(response).to render_template :edit
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
            get :show, id: @category.id

            expect(response).to redirect_to root_path
          end
        end
        describe '#edit' do
          it 'should redirect to root_path' do
            get :edit, id: @category.id

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
