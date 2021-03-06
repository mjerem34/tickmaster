# require 'rails_helper'
# RSpec.describe SessionsController, type: :controller do
#   before { @agency = create(:agency) }
#   context 'HTML' do
#     describe '#create' do
#       it 'shoud connect the user if credentials are correct' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: user.pseudo, password: user.password } }
#
#         expect(response.cookies['remember_token']).not_to eq nil
#       end
#       it 'should redirect the user when is signed in' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: user.pseudo, password: user.password } }
#
#         expect(response).to redirect_to(root_path)
#       end
#     end
#
#     describe '#new' do
#       it 'should render the form' do
#         get :new
#
#         expect(response).to render_template(:new)
#       end
#
#       it 'should redirect if already connected' do
#         user = create(:user, agency_id: @agency.id)
#         post :create, params: { session: { pseudo: user.pseudo, password: user.password } }
#
#         get :new
#
#         expect(response).to redirect_to(root_path)
#       end
#     end
#
#     describe '#destroy' do
#       it 'should signout the user/admin if is not connected' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: user.pseudo, password: nil } }
#
#         delete :destroy
#         expect(response.cookies['remember_token']).to eq nil
#       end
#     end
#   end
#
#   context 'JSON' do
#     before { request.accept = 'application/json' }
#     describe '#create' do
#       it 'should send status 200 if the user is connected' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: user.pseudo, password: user.password } }
#
#         expect(response.status).to eq 200
#       end
#       it 'should not connect the user if it does not exists' do
#         post :create, params: { session: { pseudo: 'root', password: 'toor' } }
#
#         expect(response.status).to eq 404
#       end
#       it 'should not connect the user if the pseudo is false' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: 'pseudo', password: user.password } }
#
#         expect(response.status).to eq 404
#       end
#       it 'should not connect the user if the pseudo is missing' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: nil, password: user.password } }
#
#         expect(response.status).to eq 404
#       end
#       it 'shoud connect the user if credentials are correct' do
#         user = create(:user, agency_id: @agency.id)
#
#         post :create, params: { session: { pseudo: user.pseudo, password: user.password } }
#
#         expect(response.cookies.count).to eq 1
#       end
#       context 'if user is not an admin' do
#         it 'should connect the user even if the password is false' do
#           user = create(:user, agency_id: @agency.id)
#
#           post :create, params: { session: { pseudo: user.pseudo, password: 'efrsfesf' } }
#
#           expect(response.status).to eq 200
#         end
#         it 'should connect the user even if the password is missing' do
#           user = create(:user, agency_id: @agency.id)
#
#           post :create, params: { session: { pseudo: user.pseudo, password: nil } }
#
#           expect(response.status).to eq 200
#         end
#       end
#       context 'if user is an admin' do
#         it 'should not connect the admin if the password is false' do
#           admin = create(:admin, agency_id: @agency.id)
#
#           post :create, params: { session: { pseudo: admin.pseudo, password: 'dxfgdfgdfgdr' } }
#
#           expect(response.status).to eq 404
#         end
#         it 'should not connect the admin if the password is missing' do
#           admin = create(:admin, agency_id: @agency.id)
#
#           post :create, params: { session: { pseudo: admin.pseudo, password: nil } }
#
#           expect(response.status).to eq 404
#         end
#       end
#     end
#     describe '#destroy' do
#       it 'should signout the user/admin if is connected' do
#         user = create(:user, agency_id: @agency.id)
#         post :create, params: { session: { pseudo: user.pseudo, password: nil } }
#
#         delete :destroy
#
#         expect(response.status).to eq 200
#       end
#       it "should say 'Vous êtes déjà déconnecté' if already disconnected" do
#         delete :destroy
#
#         expect(response.status).to eq 422
#       end
#     end
#     describe '#retrieve_credentials' do
#       it 'should be valid if email is valid' do
#         user = create(:user, agency_id: @agency.id, email: 'cle.expertises@gmail.com')
#         post :retrieve_credentials, email: user.email
#
#         expect(response.status).to eq 200
#       end
#
#       it 'should not be valid if email is not valid' do
#         post :retrieve_credentials, email: 'test@gmail.com'
#
#         expect(response.status).to eq 404
#       end
#     end
#   end
# end
