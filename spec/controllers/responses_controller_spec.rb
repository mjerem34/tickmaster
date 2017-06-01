require 'rails_helper'
RSpec.describe ResponsesController, type: :controller do
  describe 'JSON' do
    before do
      request.accept = 'application/json'
      agency = create(:agency)
      @user = create(:user, agency_id: agency.id)
      @tech = create(:admin, agency_id: agency.id)
      category = create(:category)
      @incident = create(:incident,
                         user_id: @user.id,
                         tech_id: @tech.id,
                         category_id: category.id,
                         sous_category_id: category.sous_categories.first.id)
    end
    context 'not connected' do
      describe '#create' do
        it 'should not create the response and render 401' do
          post :create, response: { content: 'Test', incident_id: @incident.id }

          expect(response.status).to eq 401
          expect(Response.count).to eq 0
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before { sign_in @tech }
        describe '#create' do
          it 'should create the response' do
            post :create, response: { content: 'Test', incident_id: @incident.id }

            expect(response.status).to eq 201
            expect(Response.last.content).to eq 'Test'
          end
        end
      end
      context "don't have the right" do
        before { sign_in @user }
        describe '#create' do
          it 'should not create the response and render 403' do
            post :create, response: { content: 'Test', incident_id: @incident.id }

            expect(response.status).to eq 403
            expect(Response.count).to eq 0
          end
        end
      end
    end
  end
end
