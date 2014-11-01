require 'test_helper'

class CourseModulesControllerTest < ActionController::TestCase
  setup do
    @course_module = course_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_module" do
    assert_difference('CourseModule.count') do
      post :create, course_module: { code: @course_module.code, lecturer: @course_module.lecturer, title: @course_module.title }
    end

    assert_redirected_to course_module_path(assigns(:course_module))
  end

  test "should show course_module" do
    get :show, id: @course_module
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_module
    assert_response :success
  end

  test "should update course_module" do
    patch :update, id: @course_module, course_module: { code: @course_module.code, lecturer: @course_module.lecturer, title: @course_module.title }
    assert_redirected_to course_module_path(assigns(:course_module))
  end

  test "should destroy course_module" do
    assert_difference('CourseModule.count', -1) do
      delete :destroy, id: @course_module
    end

    assert_redirected_to course_modules_path
  end
end
