require 'rails_helper'
RSpec.describe IncidentsController, type: :controller do
  describe 'JSON' do
    before { request.accept = 'application/json' }
    context 'not connected' do
      describe '#index' do
        it 'should render nothing and 401' do
          get :index

          expect(response.body).to eq 'null'
          expect(response.status).to eq 401
        end
      end

      describe '#new' do
        it 'should render nothing and 401' do
          get :new

          expect(response.body).to eq 'null'
          expect(response.status).to eq 401
        end
      end

      describe '#edit' do
        it 'should render nothing and 401' do
          agency = create(:agency)
          user = create(:user, agency_id: agency.id)
          tech = create(:admin, agency_id: agency.id)
          category = create(:category)
          incident = create(:incident,
                            user_id: user.id,
                            tech_id: tech.id,
                            category_id: category.id,
                            sous_category_id: category.sous_categories.first.id)

          get :edit, id: incident.id

          expect(response.body).to eq 'null'
          expect(response.status).to eq 401
        end
      end
    end

    context 'connected' do
      context 'have the right' do
        before do
          @agency = create(:agency)
          @admin = create(:admin, agency_id: @agency.id)
          @tech = create(:admin, agency_id: @agency.id)
          @category = create(:category)
          @incident = create(
            :incident,
            user_id: @admin.id,
            tech_id: @tech.id,
            category_id: @category.id,
            sous_category_id: @category.sous_categories.first.id
          )

          sign_in @admin
        end

        describe '#index' do
          it 'should render all incidents' do
            get :index

            expect(response.status).to eq 200
            expect(response.body).to eq [@incident].to_json
          end
        end
        describe '#show' do
          it 'should render the details of incident' do
            get :show, id: @incident.id

            expect(response.status).to eq 200
            expect(response.body).to eq @incident.to_json
          end
        end
        describe '#create' do
          it 'should create an incident' do
            post :create,
                 incident: attributes_for(
                   :incident,
                   user_id: @admin.id,
                   tech_id: @tech.id,
                   category_id: @category.id,
                   sous_category_id: @category.sous_categories.first.id
                 )

            expect(Incident.count).to eq 2
          end
        end # describe '#create'
        describe '#update' do
          it 'should update the incident' do
            put :update, id: @incident.id, incident: { title: 'test' }

            expect(response.status).to eq 204
            expect(Incident.find(@incident.id).title).to eq 'test'
          end
        end
        describe '#cloture' do
          it 'should cloture the incident and transfert responses to archives if it is the user that ask for cloture' do
            delete :cloture, id: @incident.id

            expect(response.status).to eq 200
            expect(Incident.find(@incident.id).incident_state_id_for_tech_id).to eq 7
            expect(Incident.find(@incident.id).incident_state_id_for_user_id).to eq 7
            expect(Archive.last.incident_id).to eq @incident.id
            expect(Response.count).to eq 0
          end

          it 'should ask for cloture if is the tech that cloture and do not archive' do
            incident = create(
              :incident,
              user_id: @tech.id,
              tech_id: @admin.id,
              category_id: @category.id,
              sous_category_id: @category.sous_categories.first.id
            )

            delete :cloture, id: incident.id

            expect(response.status).to eq 200
            expect(Incident.find(incident.id).incident_state_id_for_user_id).to eq 8
            expect(Incident.find(incident.id).incident_state_id_for_tech_id).to eq 9
            expect(Archive.count).to eq 0
            expect(Response.last.incident_id).to eq incident.id
          end

        end

        describe '#reject' do
          it 'should reject the incident and archive messages' do
            delete :reject, id: @incident.id

            expect(response.status).to eq 200
            expect(Incident.find(@incident.id).incident_state_id_for_tech_id).to eq 10
            expect(Incident.find(@incident.id).incident_state_id_for_user_id).to eq 10
            expect(Archive.last.content).to eq Incident.find(@incident.id).incident_state_id_for_user.name
            expect(Archive.last.incident_id).to eq @incident.id
            expect(Response.count).to eq 0
          end
        end
      end # context 'have the right'

      context "don't have the right" do
        before do
          @agency = create(:agency)
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
        end

        describe '#index' do
          it 'should render nothing and 403' do
            get :index

            expect(response.body).to eq 'null'
            expect(response.status).to eq 403
          end
        end

        describe '#new' do
          it 'should render nothing and 403' do
            get :new

            expect(response.body).to eq 'null'
            expect(response.status).to eq 403
          end
        end

        describe '#edit' do
          it 'should render nothing and 403' do
            agency = create(:agency)
            user = create(:user, agency_id: agency.id)
            tech = create(:admin, agency_id: agency.id)
            category = create(:category)
            incident = create(:incident,
                              user_id: user.id,
                              tech_id: tech.id,
                              category_id: category.id,
                              sous_category_id: category.sous_categories.first.id)

            get :edit, id: incident.id

            expect(response.body).to eq 'null'
            expect(response.status).to eq 403
          end
        end
      end # context "don't have the right"
    end # context 'connected'
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

      describe '#new' do
        it 'should redirect_to root_path' do
          get :new

          expect(response).to redirect_to root_path
        end
      end

      describe '#edit' do
        it 'should redirect_to root_path' do
          agency = create(:agency)
          user = create(:user, agency_id: agency.id)
          tech = create(:admin, agency_id: agency.id)
          category = create(:category)
          incident = create(:incident,
                            user_id: user.id,
                            tech_id: tech.id,
                            category_id: category.id,
                            sous_category_id: category.sous_categories.first.id)

          get :edit, id: incident.id

          expect(response).to redirect_to root_path
        end
      end
    end
    context 'connected' do
      context 'have the right' do
        before do
          @agency = create(:agency)
          @admin = create(:admin, agency_id: @agency.id)
          @user = create(:user, agency_id: @agency.id)

          sign_in @admin
        end
        describe '#index' do
          it 'should render template' do
            get :index

            expect(response).to render_template :index
          end
        end
        describe '#new' do
          it 'should render template' do
            create(:category)
            get :new

            expect(response).to render_template :new
          end
        end
        describe '#edit' do
          it 'should render template' do
            category = create(:category)
            incident = create(:incident,
                              user_id: @user.id,
                              tech_id: @admin.id,
                              category_id: category.id,
                              sous_category_id: category.sous_categories.first.id)

            get :edit, id: incident.id

            expect(response).to render_template :edit
          end
        end
      end

      context "don't have the right" do
        before do
          @agency = create(:agency)
          @user = create(:user, agency_id: @agency.id)

          sign_in @user
        end
        describe '#index' do
          it 'should redirect_to root_path' do
            get :index

            expect(response).to redirect_to root_path
          end
        end

        describe '#new' do
          it 'should redirect_to root_path' do
            get :new

            expect(response).to redirect_to root_path
          end
        end

        describe '#edit' do
          it 'should redirect_to root_path' do
            tech = create(:admin, agency_id: @agency.id)
            category = create(:category)
            incident = create(:incident,
                              user_id: @user.id,
                              tech_id: tech.id,
                              category_id: category.id,
                              sous_category_id: category.sous_categories.first.id)

            get :edit, id: incident.id

            expect(response).to redirect_to root_path
          end
        end
      end
    end
  end
end
