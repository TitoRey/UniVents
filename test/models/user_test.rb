require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

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
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    user.save
    debugger
    event = Event.new(:event_name=>"Name3",:event_description=>"DESC3",:event_time=>DateTime.now + 1.month,:user_id=>(user.id+1),:flagged=>true,:created_at=>DateTime.now,:updated_at=>DateTime.now)
    
    event.save
    eventP2 = EventUser.new(:event_id=>2,:user_id=>user.id)
    eventP2.save
    debugger
    assert (user.currently_registered_to(event))
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
