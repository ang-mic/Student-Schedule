require 'test_helper'

class UserEventsControllerTest < ActionController::TestCase
  setup do
    @user_event = user_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_event" do
    assert_difference('UserEvent.count') do
      post :create, user_event: { colour: @user_event.colour, date: @user_event.date, description: @user_event.description, end_at: @user_event.end_at, privacy: @user_event.privacy, repeat_frequency: @user_event.repeat_frequency, repeat_type: @user_event.repeat_type, start_at: @user_event.start_at, title: @user_event.title }
    end

    assert_redirected_to user_event_path(assigns(:user_event))
  end

  test "should show user_event" do
    get :show, id: @user_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_event
    assert_response :success
  end

  test "should update user_event" do
    patch :update, id: @user_event, user_event: { colour: @user_event.colour, date: @user_event.date, description: @user_event.description, end_at: @user_event.end_at, privacy: @user_event.privacy, repeat_frequency: @user_event.repeat_frequency, repeat_type: @user_event.repeat_type, start_at: @user_event.start_at, title: @user_event.title }
    assert_redirected_to user_event_path(assigns(:user_event))
  end

  test "should destroy user_event" do
    assert_difference('UserEvent.count', -1) do
      delete :destroy, id: @user_event
    end

    assert_redirected_to user_events_path
  end
end
