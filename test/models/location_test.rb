require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid location" do
    event = Event.new(:id=>1,:event_name=>"Name3",:event_description=>"DESC3",:event_time=>DateTime.now + 1.month,:user_id=>(1),:flagged=>true,:created_at=>DateTime.now,:updated_at=>DateTime.now)
    location = Location.new(:street_address=>"4520 Patriot Circle",:zipcode=>22030,:county=>"Fairfax",:city=>"Fairfax",:coordinates=>"38.82676138216578, -77.3043588053449",:event_id=>1)
    debugger
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
