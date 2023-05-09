require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.destroy_all
    Event.destroy_all
    @user = User.create(email: 'test@gmu.edu', password: 'Password1234!', 
                        first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id )
    post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_includes @response.body, 'Dashboard'
    assert_response :success
  end

  test "should create event" do
    # Logging In
    follow_redirect!

    assert_difference "Event.count" do
      post events_url, params: { event: { 
                                    event_name: 'Test Event', event_description: 'test description',
                                    event_start_date: '2023-05-11', event_start_time: '18:24', user_id: @user.id} }
    end
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { event_name: 'Other Event', event_description: @event.event_description, 
                                       event_start_date: '2023-05-11', event_start_time: '18:24', user_id: @user.id} }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
