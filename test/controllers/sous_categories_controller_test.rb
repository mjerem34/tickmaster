require 'test_helper'

class SousCategoriesControllerTest < ActionController::TestCase
  setup do
    @sous_category = sous_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sous_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sous_category" do
    assert_difference('SousCategory.count') do
      post :create, sous_category: {  }
    end

    assert_redirected_to sous_category_path(assigns(:sous_category))
  end

  test "should show sous_category" do
    get :show, id: @sous_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sous_category
    assert_response :success
  end

  test "should update sous_category" do
    patch :update, id: @sous_category, sous_category: {  }
    assert_redirected_to sous_category_path(assigns(:sous_category))
  end

  test "should destroy sous_category" do
    assert_difference('SousCategory.count', -1) do
      delete :destroy, id: @sous_category
    end

    assert_redirected_to sous_categories_path
  end
end
