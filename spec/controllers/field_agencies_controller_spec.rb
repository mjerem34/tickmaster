require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe FieldAgenciesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # FieldAgency. As you add validations to FieldAgency, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FieldAgenciesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all field_agencies as @field_agencies" do
      field_agency = FieldAgency.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:field_agencies)).to eq([field_agency])
    end
  end

  describe "GET #show" do
    it "assigns the requested field_agency as @field_agency" do
      field_agency = FieldAgency.create! valid_attributes
      get :show, params: {id: field_agency.to_param}, session: valid_session
      expect(assigns(:field_agency)).to eq(field_agency)
    end
  end

  describe "GET #new" do
    it "assigns a new field_agency as @field_agency" do
      get :new, params: {}, session: valid_session
      expect(assigns(:field_agency)).to be_a_new(FieldAgency)
    end
  end

  describe "GET #edit" do
    it "assigns the requested field_agency as @field_agency" do
      field_agency = FieldAgency.create! valid_attributes
      get :edit, params: {id: field_agency.to_param}, session: valid_session
      expect(assigns(:field_agency)).to eq(field_agency)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new FieldAgency" do
        expect {
          post :create, params: {field_agency: valid_attributes}, session: valid_session
        }.to change(FieldAgency, :count).by(1)
      end

      it "assigns a newly created field_agency as @field_agency" do
        post :create, params: {field_agency: valid_attributes}, session: valid_session
        expect(assigns(:field_agency)).to be_a(FieldAgency)
        expect(assigns(:field_agency)).to be_persisted
      end

      it "redirects to the created field_agency" do
        post :create, params: {field_agency: valid_attributes}, session: valid_session
        expect(response).to redirect_to(FieldAgency.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved field_agency as @field_agency" do
        post :create, params: {field_agency: invalid_attributes}, session: valid_session
        expect(assigns(:field_agency)).to be_a_new(FieldAgency)
      end

      it "re-renders the 'new' template" do
        post :create, params: {field_agency: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested field_agency" do
        field_agency = FieldAgency.create! valid_attributes
        put :update, params: {id: field_agency.to_param, field_agency: new_attributes}, session: valid_session
        field_agency.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested field_agency as @field_agency" do
        field_agency = FieldAgency.create! valid_attributes
        put :update, params: {id: field_agency.to_param, field_agency: valid_attributes}, session: valid_session
        expect(assigns(:field_agency)).to eq(field_agency)
      end

      it "redirects to the field_agency" do
        field_agency = FieldAgency.create! valid_attributes
        put :update, params: {id: field_agency.to_param, field_agency: valid_attributes}, session: valid_session
        expect(response).to redirect_to(field_agency)
      end
    end

    context "with invalid params" do
      it "assigns the field_agency as @field_agency" do
        field_agency = FieldAgency.create! valid_attributes
        put :update, params: {id: field_agency.to_param, field_agency: invalid_attributes}, session: valid_session
        expect(assigns(:field_agency)).to eq(field_agency)
      end

      it "re-renders the 'edit' template" do
        field_agency = FieldAgency.create! valid_attributes
        put :update, params: {id: field_agency.to_param, field_agency: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested field_agency" do
      field_agency = FieldAgency.create! valid_attributes
      expect {
        delete :destroy, params: {id: field_agency.to_param}, session: valid_session
      }.to change(FieldAgency, :count).by(-1)
    end

    it "redirects to the field_agencies list" do
      field_agency = FieldAgency.create! valid_attributes
      delete :destroy, params: {id: field_agency.to_param}, session: valid_session
      expect(response).to redirect_to(field_agencies_url)
    end
  end

end
