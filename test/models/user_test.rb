require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

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

  test "valid registration" do
    #location = Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:county=> "Fairfax",:city=>"Fairfax",:event_id => 10)
    assert User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false).save
    # Need to write assertion that   does not throw exceptions
  end

  test "correct name" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    boolean = (user.full_name == "hello crazy")
    assert boolean
  end

  test "currently_registered" do
    @eventP2 = EventUser.create(:event_id=>@event.id,:user_id=>@other_user.id)
    assert @other_user.currently_registered_to(:event=>@event)
  end

  test "count events" do
    @other_user = User.create(email: 'test12@gmu.edu', password: 'Password12345!', 
                        first_name: 'Douglas1', last_name: 'Patrick1', active: true, admin: true)
    eu1 = EventUser.create(:event_id=>@event.id,:user_id=>@other_user.id)
    @event1 = Event.create(event_name: 'Main Event1', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id)
    eu2 = EventUser.create(:event_id=>@event1.id,:user_id=>@other_user.id)
    @event2 = Event.create(event_name: 'Main Event2', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id)
    eu3= EventUser.create(:event_id=>@event2.id,:user_id=>@other_user.id)
    @event3 = Event.create(event_name: 'Main Event3', event_description: 'Main Event Description',
                          event_time: DateTime.now + 1.month, user_id: @user.id)
    eu4 = EventUser.create(:event_id=>@event3.id,:user_id=>@other_user.id)
    assert @other_user.events_signed_up_for==4
  end

  test "inv reg missing field" do
    assert_not User.new(:password=>"ABCSDS231",:first_name=>"hello").save
    # no fields - should return an exception since none of the fields are filled out
  end

  test "inv reg weak password" do
      assert_not User.new(:password=>"31",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false).save
  end
  
   test "inv reg wrong email" do
    assert_not User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmail.com",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false).save
  end

  test "inv reg mismatch password" do
    assert_not User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS234234231",:admin=>false).save
  end

  test "valid login" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    username = "ssekar+00000@gmu.edu"
    password = "ABCSDS231"
    user.save
    boolean = (user.email == username) and (user.password == password)
    assert boolean
  end
  test "invalid login" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    username1 = "ssekar+0000@gmu.edu"
    password2 = "ABCSDS2323421"
    user.save
    boolean = (user.email == username1) and (user.password == password2)
    assert_not boolean
  end

  test "is admin" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    assert_not user.is_admin?
  end
  
  test "delete user" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    user.save
    assert user.delete
  end
  test "update user" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    user.save
    user.update(:last_name=>"Jake")
    assert user.last_name=="Jake"
  end 
end
