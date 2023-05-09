require "test_helper"

class EventUserTest < ActiveSupport::TestCase

  setup do
    User.destroy_all
    Event.destroy_all
    @user = User.create(email: 'test@gmu.edu', password: 'Password1234!', 
                        first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @other_user = User.create(email: 'test1@gmu.edu', password: 'Password12345!', 
                        first_name: 'Douglas1', last_name: 'Patrick1', active: true, admin: true)
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id)
    #post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
  end

  test "non-host can participate" do
    assert EventUser.create(user_id: @other_user.id, event_id: @event.id)
  end

  test "host cannot participate" do
    event = EventUser.create(user_id: @user.id, event_id: @event.id)
    assert_not event.save
  end
end