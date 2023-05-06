require "test_helper"

class EventUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "signup" do
    user = User.create(email: 'test@gmu.edu', password: 'Password1234!', 
    first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description', event_time: DateTime.now - 1.month, user_id: user.id+1)
    assert EventUser.create(user_id: user.id, event_id: event.id)
  end
end