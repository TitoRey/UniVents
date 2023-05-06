require "test_helper"

class EventUserControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.destroy_all
    Event.destroy_all
    @user = User.create(email: 'test@gmu.edu', password: 'Password1234!', 
                        first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @other_user = User.create(email: 'other@gmu.edu', password: 'Password1234!', 
                              first_name: 'Other', last_name: 'Patrick', active: true, admin: true)
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id )
  end

  test 'user can sign up to event' do 
    post user_session_url, params: { user: { email: @other_user.email, password: @other_user.password, commit: 'Log in' } }
    assert_difference "EventUser.count" do 
      post event_user_index_url, params: { user_id: @other_user.id, event_user: { user_id: @other_user.id, event_id: @event.id } } 
    end
  end

  test 'user can deregister from event' do 
    post user_session_url, params: { user: { email: @other_user.email, password: @other_user.password, commit: 'Log in' } }
    event_user = EventUser.create(user_id: @other_user.id, event_id: @event.id)
    assert_difference("EventUser.count", -1) do 
      delete event_user_url(id: event_user.id, user_id: @other_user.id)
    end
  end
end