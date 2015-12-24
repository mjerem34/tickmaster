require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post :create, incident: { category_id: @incident.category_id, content: @incident.content, date_cloture: @incident.date_cloture, date_maj: @incident.date_maj, date_ouverture: @incident.date_ouverture, tech_id: @incident.tech_id, user_id: @incident.user_id }
    end

    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should show incident" do
    get :show, id: @incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident
    assert_response :success
  end

  test "should update incident" do
    patch :update, id: @incident, incident: { category_id: @incident.category_id, content: @incident.content, date_cloture: @incident.date_cloture, date_maj: @incident.date_maj, date_ouverture: @incident.date_ouverture, tech_id: @incident.tech_id, user_id: @incident.user_id }
    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete :destroy, id: @incident
    end

    assert_redirected_to incidents_path
  end
end
