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

  test "inv reg missing field" do
    assert_raise (Exception) {
      user = User.new(:password=>"ABCSDS231",:first_name=>"hello")
  }
    
    # no fields - should return an exception since none of the fields are filled out
  end
  test "inv reg weak password" do
      user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"cry",:password_confirmation=>"ABCSDS231",:admin=>false)
      assert user.valid?
  end
   test "inv reg wrong email" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmail.com",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
    assert user.valid?
  end
  test "inv reg mismatch password" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS234234231",:admin=>false)
    assert user.valid?
  end
  test "user exists" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
    user2 = User.find(:email => "ssekar+0000.gmu.edu")
    assert user==user2
  end
  test "valid login" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
    username = "ssekar+0000@gmu.edu"
    password = "ABCSDS231"
    boolean = (user.email == username) and (user.password == password)
    assert boolean
  end
  test "invalid login" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
    username = "ssekar+0000@gmu.edu"
    password = "ABCSDS2323421"
    boolean = (user.email == username) and (user.password == password)
    assert_not boolean
  end
  test "logged in" do
    
  end

  test "logged out" do
    
  end

  test "remembered" do
    
  end
  test "is admin" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
    assert user.is_admin == false
  end
  
  test "delete user" do
    user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
    # Need to write assertion
  end
  test "update user" do

  end 
end
