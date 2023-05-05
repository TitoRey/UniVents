require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.destroy_all
    Event.destroy_all
    @user = User.create(email: 'test@gmu.edu', password: 'Password1234!', 
                        first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id )
    post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  # test "should create location" do
  #   assert_difference("Location.count") do
  #     post locations_url, params: { location: {  } }
  #   end

  # end
end
