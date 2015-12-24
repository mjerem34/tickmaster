require 'test_helper'

class TechesControllerTest < ActionController::TestCase
  setup do
    @tech = teches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tech" do
    assert_difference('Tech.count') do
      post :create, tech: { level: @tech.level, password: @tech.password, pseudo: @tech.pseudo }
    end

    assert_redirected_to tech_path(assigns(:tech))
  end

  test "should show tech" do
    get :show, id: @tech
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tech
    assert_response :success
  end

  test "should update tech" do
    patch :update, id: @tech, tech: { level: @tech.level, password: @tech.password, pseudo: @tech.pseudo }
    assert_redirected_to tech_path(assigns(:tech))
  end

  test "should destroy tech" do
    assert_difference('Tech.count', -1) do
      delete :destroy, id: @tech
    end

    assert_redirected_to teches_path
  end
end
