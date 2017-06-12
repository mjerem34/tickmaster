require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  setup :activate_authlogic
  before { @agency = create(:agency) }
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
      describe '#index' do
        it 'should redirect to root_path' do
          get :index

          expect(response).to redirect_to(root_path)
        end
      end
      describe '#show' do
        it 'should redirect to root path' do
          user = create(:user, agency_id: @agency.id)
          logout user

          get :show, id: user.id

          expect(response).to redirect_to(root_path)
        end
      end
      describe '#new' do
        it 'should render the form' do
          get :new

          expect(response).to render_template(:new)
        end
      end
      describe '#edit' do
        it 'should redirect to root path' do
          user = create(:user, agency_id: @agency.id)
          logout user

          get :edit, id: user.id

          expect(response).to redirect_to root_path
        end
      end
      describe '#to_treat' do
        it 'should redirect to root path' do
          user = create(:user, agency_id: @agency.id)
          logout user

          get :edit, id: user.id

          expect(response).to redirect_to root_path
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
          it 'should display the whole list of user' do
            get :index

            expect(response).to render_template(:index)
          end
        end
        describe '#show' do
          it 'should display the list of the incidents of the user' do
            get :show, id: @admin.id

            expect(response).to render_template :show
          end
        end
        describe '#edit' do
          it "should render the form if it's his profile" do
            get :edit, id: @admin.id

            expect(response).to render_template(:edit)
          end
          it "should render the form if it's not his profile" do
            user = create(:user, agency_id: @agency.id)

            get :edit, id: user.id

            expect(response).to render_template(:edit)
          end
        end
        describe '#to_treat' do
          it 'should render to treat template' do
            get :to_treat, id: @admin.id

            expect(response).to render_template :to_treat
          end
        end
      end
      context 'does not have the right' do
        before do
          @user = create(:user, agency_id: @agency.id)

          login @user
        end
        describe '#index' do
          it 'should redirect to root_path' do
            get :index

            expect(response).to redirect_to root_path
          end
        end
        describe '#edit' do
          it "should redirect to root path if it's not his profile" do
            user = create(:user, agency_id: @agency.id)

            get :edit, id: user.id

            expect(response).not_to render_template(:edit)
            expect(response).to redirect_to root_path
          end
        end
        describe '#to_treat' do
          it 'should redirect to root_path' do
            get :to_treat, id: @user.id

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
  describe 'JSON' do
    before { request.accept = 'application/json' }
    it 'should content-type include app/json' do
      post :create, user: attributes_for(:user, agency_id: @agency.id)

      expect(response.header['Content-Type']).to eq(
        'application/json; charset=utf-8'
      )
    end
    context 'when is not connected' do
      describe '#index' do
        it 'should have status unauthorized' do
          get :index

          expect(response.status).to eq(401)
        end
        it 'should return nothing' do
          get :index

          expect(response.body).not_to eq(User.all.to_json)
        end
      end

      describe '#show' do
        it 'should render status unauthorized' do
          user = create(:user, agency_id: @agency.id)
          logout user

          get :show, id: user.id

          expect(response.status).to eq(401)
        end
      end
      describe '#to_treat' do
        it 'should render status unauthorized' do
          user = create(:user, agency_id: @agency.id)
          logout user

          get :to_treat, id: user.id

          expect(response.status).to eq(401)
        end
      end
      describe '#create' do
        it 'should create an user and render created' do
          post :create, user: attributes_for(:user, agency_id: @agency.id)

          expect(response.status).to eq(201)
        end
        it 'should create an user' do
          post :create, user: attributes_for(:user, agency_id: @agency.id)

          expect(User.count).to eq(1)
        end
        it 'should not create an admin' do
          post :create, user: attributes_for(:admin, agency_id: @agency.id)

          expect(User.count).to eq(0)
        end
        it 'should not create an admin and render unprocessable_entity' do
          post :create, user: attributes_for(:admin, agency_id: @agency.id)

          expect(response.status).to eq(403)
        end
      end
      describe '#update' do
        it 'should render status unauthorized' do
          user = create(:user, agency_id: @agency.id)
          logout user

          put :update, id: user.id, user: attributes_for(:user,
                                                         agency_id: @agency.id)

          expect(response.status).to eq(401)
        end
      end
      describe '#destroy' do
        it 'should render status unauthorized' do
          user = create(:user, agency_id: @agency.id)
          logout user

          delete :destroy, id: user.id

          expect(response.status).to eq(401)
        end
        it 'should not delete the user' do
          user = create(:user, agency_id: @agency.id)

          delete :destroy, id: user.id

          expect(User.count).to eq(1)
        end
      end
    end
    context 'when is connected' do
      context 'when user have not the authorization to do' do
        before do
          @user = create(:user, agency_id: @agency.id)

          login(@user)
        end
        describe '#index' do
          it 'should render status unauthorized' do
            get :index

            expect(response.status).to eq(403)
          end
          it 'should render nothing in body' do
            get :index

            expect(response.body).not_to eq(User.all.to_json)
          end
        end
        describe '#show' do
          it 'should render status 403' do
            get :show, id: @user.id

            expect(response.status).to eq(403)
          end
          it 'should show nothing in body' do
            tech = create(:admin, agency_id: @agency.id)
            category = create(:category)
            create(:incident,
                   user_id: @user.id,
                   tech_id: tech.id,
                   category_id: category.id,
                   sous_category_id: category.sous_categories.first.id)

            get :show, id: @user.id

            expect(response.body).to eq 'null'
          end
        end
        describe '#to_treat' do
          it 'should render status unauthorized' do
            get :to_treat, id: @user.id

            expect(response.status).to eq(403)
          end
        end
        describe '#create' do
          it 'should not create an admin' do
            post :create, user: attributes_for(:admin, agency_id: @agency.id)

            expect(User.count).to eq(1)
          end
          it 'should return 403 code' do
            post :create, user: attributes_for(:admin, agency_id: @agency.id)

            expect(response.status).to eq(403)
          end
        end
        describe '#update' do
          it 'should render status ok if is his profile' do
            put :update, id: @user.id, user: attributes_for(:user,
                                                            agency_id:
                                                            @agency.id)

            expect(response.status).to eq(200)
          end
          it 'should render status unauthorized if is not his profile' do
            new_user = create(:user, agency_id: @agency.id)

            put :update, id: new_user.id, user: attributes_for(:user,
                                                               agency_id:
                                                               @agency.id)

            expect(response.status).to eq(403)
          end
          it "should edit the user if it's his profile" do
            put :update, id: @user.id, user: { name: 'nijhioj' }

            expect(User.find(@user.id).name).to eq('nijhioj')
          end
          it "should not edit the user if it's not his profile" do
            new_user = create(:user, agency_id: @agency.id)
            before = new_user.name

            put :update, id: new_user.id, user: attributes_for(:user,
                                                               agency_id:
                                                               @agency.id)

            expect(new_user.name).to eq(before)
          end
        end
        describe '#destroy' do
          it 'should render status unauthorized' do
            new_user = create(:user, agency_id: @agency.id)

            delete :destroy, id: new_user.id

            expect(response.status).to eq 403
          end
          it 'should not destroy the user' do
            new_user = create(:user, agency_id: @agency.id)

            delete :destroy, id: new_user.id

            expect(User.count).to eq 2
          end
        end
      end
      context 'when user have the authorization to do' do
        before do
          @admin = create(:admin, agency_id: @agency.id)

          login @admin
        end
        describe '#create' do
          context 'with invalid attributes' do
            it 'should not create an user' do
              post :create, user: attributes_for(:invalid_user)

              expect(User.count).to eq(1)
              expect(response.status).to eq(422)
            end
          end

          context 'with valid attributes' do
            it 'should create a normal user' do
              post :create, user: attributes_for(:user, agency_id: @agency.id)

              expect(User.count).to eq 2
            end

            it 'should create an tech' do
              post :create, user: attributes_for(:admin, agency_id: @agency.id)

              expect(User.count).to eq 2
            end

            it 'should respond with :created status' do
              post :create, user: attributes_for(:admin, agency_id: @agency.id)

              expect(response.status).to eq(201)
            end
          end
        end

        describe '#destroy' do
          it 'should respond with success' do
            new_user = create(:user, agency_id: @agency.id)

            delete :destroy, id: new_user.id

            expect(response.status).to eq(200)
          end

          it 'should not destroy the user' do
            new_user = create(:user, agency_id: @agency.id)

            delete :destroy, id: new_user.id

            expect(User.count).to eq 2
          end
        end

        describe '#index' do
          it 'should display the users list' do
            get :index

            expect(response.body).to eq(User.all.to_json)
          end

          it 'should respond with 200 ok status' do
            get :index

            expect(response.status).to eq(200)
          end
        end

        describe '#to_treat' do
          it 'should render the incidents the admin have to treat' do
            user = create(:user, agency_id: @agency.id)
            category = create(:category)
            create(:incident,
                   user_id: user.id,
                   tech_id: @admin.id,
                   category_id: category.id,
                   sous_category_id: category.sous_categories.first.id,
                   incident_state_id_for_tech_id: 2,
                   incident_state_id_for_user_id: 2
                   )

            get :to_treat, id: @admin.id

            expect(response.body).to eq @admin.tech_incidents.to_json
          end
        end
        describe '#update' do
          it 'should edit an part of the user' do
            put :update, id: @admin.id, user: { name: 'nijhioj' }

            expect(User.find(@admin.id).name).to eq('nijhioj')
          end
          it 'should edit an part of other user' do
            new_user = create(:user, agency_id: @agency.id)

            put :update, id: new_user.id, user: { name: 'nijhioj' }

            expect(User.find(new_user.id).name).to eq('nijhioj')
          end
          it 'should render status ok' do
            new_user = create(:user, agency_id: @agency.id)

            put :update, id: new_user.id, user: { name: 'nijhioj' }

            expect(response.status).to eq 200
          end
        end
      end
    end
  end
end
