require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:factoryUser)
    sign_in @user
    current_user @user
  end

  let(:valid_session) { {} }
  describe 'GET #index' do
    it 'assigns all users as @users' do
      get :index
      expect(assigns(:users)).to eq(@user)
    end
    it 'Render the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user as @user' do
      user = @user
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested user as @user' do
      user = @user
      get :edit, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, { user: valid_attributes }, valid_session
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, { user: valid_attributes }, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, { user: valid_attributes }, valid_session
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, { user: invalid_attributes }, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, { user: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        # "pseudo" = "testNew"
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested user' do
        user = @user
        put :update, { id: user.to_param, user: new_attributes }, valid_session
        user.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested user as @user' do
        user = @user
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'redirects to the user' do
        user = @user
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(response).to redirect_to(user)
      end
    end

    context 'with invalid params' do
      it 'assigns the user as @user' do
        user = @user
        put :update, { id: user.to_param, user: invalid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = @user
        put :update, { id: user.to_param, user: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  it 'should have a current_user' do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(:current_user).to_not eq(nil)
  end
end
