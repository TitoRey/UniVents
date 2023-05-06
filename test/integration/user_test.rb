require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:userValidA)
  end

  test "User can't view dashboard if not logged in" do
    userA = users(:userValidA)
    sign_out userA
    get user_path(userA)
    assert_response :redirect
  end

  test "User can't view events if not logged in" do
    userA = users(:userValidA)
    sign_out userA
    get events_path
    assert_response :redirect
  end

  test "User can't create events if not logged in" do
    userA = users(:userValidA)
    sign_out userA
    get new_event_path
    assert_response :redirect
  end

  test "User can view dashboard if logged in" do
    userA = users(:userValidA)
    get user_path(userA)
    assert_response :success
  end

  test "User can create and edit events" do
    userA = users(:userValidA)
    post events_path, params: { event: { user_id: userA.id, event_name: 'Main Event', event_description: 'Main Event Description', event_start_date: Date.tomorrow(), event_start_time: Time.now }}
    assert_response :redirect
    follow_redirect!

    eventA = Event.last
    patch event_path(eventA), params: { event: { user_id: userA.id, event_name: 'Sub Event', event_description: 'Sub Event Description', event_start_date: Date.tomorrow(), event_start_time: Time.now }}
    assert_response :redirect
    follow_redirect!

    eventA.reload
    assert_equal 'Sub Event', Event.last.event_name
  end

  test "User can join events" do
    userA = users(:userValidA)
    userB = users(:userValidB)

    post events_path, params: { event: { user_id: userA.id, event_name: 'Main Event', event_description: 'Main Event Description', event_start_date: Date.tomorrow(), event_start_time: Time.now }}
    assert_response :redirect
    follow_redirect!

    eventA = Event.last

    sign_out userA
    sign_in userB

    post event_user_index_url, params: { user_id: userB.id, event_user: { user_id: userB.id, event_id: eventA.id }}
    assert_response :redirect
    follow_redirect!

    assert userB.currently_registered_to(:event=>eventA)
  end

  test "User can't join a deleted event" do
    userA = users(:userValidA)
    userB = users(:userValidB)

    post events_path, params: { event: { user_id: userA.id, event_name: 'Main Event', event_description: 'Main Event Description', event_start_date: Date.tomorrow(), event_start_time: Time.now }}
    assert_response :redirect
    follow_redirect!

    eventA = Event.last

    delete event_path(eventA)

    sign_out userA
    sign_in userB

    assert_raises(Exception) { post event_user_index_url, params: { user_id: userB.id, event_user: { user_id: userB.id, event_id: eventA.id }} }
  end
end
