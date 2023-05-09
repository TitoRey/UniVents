require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    User.destroy_all
    Event.destroy_all
    @other_user = User.create(email: 'other@gmu.edu', password: 'Password1234!', 
                              first_name: 'Other', last_name: 'Patrick', active: true, admin: true)
    @user = User.create(email: 'test@gmu.edu', password: 'Password1234!', 
                        first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id )
    #post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
  end

  test "valid event" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id )
    assert @event.save
  end
  test "update event" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id )
    @event.update(:event_name=>"Main Event 2")
    assert @event.event_name=="Main Event 2"
  end
  test "invalid event missing field" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month)
    # Missing the host User_Id which is vital to make sure that the event is created
    assert_not @event.save
  end
  test "is flagged" do
    @event2 = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month,:flagged=>true)
    assert @event2.flagged == true
  end
  test "delete event" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month,:flagged=>true)
    assert @event.delete
  end
  test "user_signed_up" do
    eu = EventUser.create(user_id: @other_user.id, event_id: @event.id)
    assert eu.save
  end
  test "owner_email" do
    assert @event.owner_email=="test@gmu.edu"
  end
  test "event_date_and_time" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.new(2023, 8, 29, 22, 35, 0),flagged:false)
    string = "August 29, 2023 (10:35 PM)"
    assert @event.event_date_and_time==string
  end
  test "all users" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
      event_time: DateTime.new(2023, 8, 29, 22, 35, 0),flagged:false,user_id: @user.id)
    @user1 = User.create(email: 'test1@gmu.edu', password: 'Password1234!', 
      first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @user2 = User.create(email: 'test2@gmu.edu', password: 'Password1234!', 
      first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @user3 = User.create(email: 'test3@gmu.edu', password: 'Password1234!', 
      first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @user4 = User.create(email: 'test4@gmu.edu', password: 'Password1234!', 
      first_name: 'Douglas', last_name: 'Patrick', active: true, admin: true)
    @event_user1 = EventUser.create(user_id: @user1.id, event_id: @event.id)
    @event_user2 = EventUser.create(user_id: @user2.id, event_id: @event.id)
    @event_user3 = EventUser.create(user_id: @user3.id, event_id: @event.id)
    @event_user4 = EventUser.create(user_id: @user4.id, event_id: @event.id)
    #puts @event.all_users_signed_up.count
    #puts @event.all_users_signed_up
    assert @event.all_users_signed_up == [@user1,@user2,@user3,@user4]
  end
  test "flag" do
    @event = Event.create(event_name: 'Main Event', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month,:flagged=>false)
    @event.flag(true)
    assert @event.flagged==true
  end
end
