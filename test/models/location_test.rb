require "test_helper"

class LocationTest < ActiveSupport::TestCase
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
  test "valid location" do
    location = Location.new(:street_address=>"4520 Patriot Circle",:zipcode=>22030,:county=>"Fairfax",:city=>"Fairfax",:coordinates=>"38.82676138216578, -77.3043588053449",:event_id=>@event.id)
    assert location.save
    # Should assert creation successful
  end

  test "missing field" do
    assert_not Location.new(:street_address => "4400 University Drive",:zipcode=>22030,:city=>"Fairfax",:county=> "Fairfax").save
  # Missing coordinates -> Should return exception
  end
  
  test "destroy location" do
    location = Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:city=>"Fairfax",:county=> "Fairfax",:event_id => 1)
    location.save
    assert location.destroy
  end
  
  test "string location" do
    location = Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:city=>"Fairfax",:county=> "Fairfax",:event_id => 1)
    location.save
    assert location.full_address=="4400 University Drive, Fairfax, 22030"
  end

  test "update location" do
    location = Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:city=>"Fairfax",:county=> "Fairfax",:event_id => 1)
    location.save
    location.update(:street_address=>"4500 University Drive")
    location.save
    assert location.street_address=="4500 University Drive"
  end
end
