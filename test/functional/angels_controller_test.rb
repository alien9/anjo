require 'test_helper'

class AngelsControllerTest < ActionController::TestCase
  setup do
    @angel = angels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:angels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create angel" do
    assert_difference('Angel.count') do
      post :create, :angel => @angel.attributes
    end

    assert_redirected_to angel_path(assigns(:angel))
  end

  test "should show angel" do
    get :show, :id => @angel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @angel.to_param
    assert_response :success
  end

  test "should update angel" do
    put :update, :id => @angel.to_param, :angel => @angel.attributes
    assert_redirected_to angel_path(assigns(:angel))
  end

  test "should destroy angel" do
    assert_difference('Angel.count', -1) do
      delete :destroy, :id => @angel.to_param
    end

    assert_redirected_to angels_path
  end
end
