require 'rails_helper'
RSpec.describe IncidentsController, type: :controller do
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do; end
      describe '#index' do; end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @agency = create(:agency)
          @admin = create(:admin, agency_id: @agency.id)

          sign_in @admin
        end
        describe '#create' do
          it 'should create an incident' do
            tech = create(:admin, agency_id: @agency.id)
            category = create(:category)

            post :create,
                 incident: attributes_for(
                   :incident,
                   user_id: @admin.id,
                   tech_id: tech.id,
                   category_id: category.id,
                   sous_category_id: category.sous_categories.first.id,
                   file_incidents: []
                 )

            expect(Incident.count).to eq 1
          end
          it 'should create an incident with attachments' do
            
          end
        end
      end
      context "don't have the right" do
      end
    end
  end
  describe 'HTML' do
    before { request.accept = 'text/html' }
    context 'not connected' do
    end
    context 'connected' do
      context 'have the right' do
      end
      context "don't have the right" do
      end
    end
  end
end
