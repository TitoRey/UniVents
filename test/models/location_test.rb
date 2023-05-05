require "test_helper"

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid location" do
  assert Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:city=>"Fairfax",:county=> "Fairfax",:event_id => 1).save
  # Should assert creation successful
  end

  test "missing field" do
    assert_raise(Exception) {
    Location.new(:street_address => "4400 University Drive",:zipcode=>22030,:city=>"Fairfax",:county=> "Fairfax").save
  # Missing coordinates -> Should return exception
  }
  end
  
  test "destroy location" do
    location = Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:city=>"Fairfax",:county=> "Fairfax",:event_id => 1)
    location.create
    location.destroy

  end
  
  test "string location" do
    location = Location.new(:street_address => "4400 University Drive",:zipcode=> 22030,:city=>"Fairfax",:county=> "Fairfax",:event_id => 1)
    location.create
    assert location.full_address=="4400 University Drive, Farifax, 22030"
  end
end
