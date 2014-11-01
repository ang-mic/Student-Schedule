require 'test_helper'

class WebmastersControllerTest < ActionController::TestCase
  setup do
    @webmaster = webmasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webmasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webmaster" do
    assert_difference('Webmaster.count') do
      post :create, webmaster: { first_name: @webmaster.first_name, last_name: @webmaster.last_name, password: @webmaster.password, username: @webmaster.username }
    end

    assert_redirected_to webmaster_path(assigns(:webmaster))
  end

  test "should show webmaster" do
    get :show, id: @webmaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @webmaster
    assert_response :success
  end

  test "should update webmaster" do
    patch :update, id: @webmaster, webmaster: { first_name: @webmaster.first_name, last_name: @webmaster.last_name, password: @webmaster.password, username: @webmaster.username }
    assert_redirected_to webmaster_path(assigns(:webmaster))
  end

  test "should destroy webmaster" do
    assert_difference('Webmaster.count', -1) do
      delete :destroy, id: @webmaster
    end

    assert_redirected_to webmasters_path
  end
end
