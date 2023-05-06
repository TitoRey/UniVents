require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:userValidA)
  end

  test "User can't view dashboard if not logged in" do
    userA = users(:userValidA)
    sign_out userA
    get user_path(userA)
    assert_response :redirect
  end

  test "User can't view events if not logged in" do
    userA = users(:userValidA)
    sign_out userA
    get events_path
    assert_response :redirect
  end

  test "User can't create events if not logged in" do
    userA = users(:userValidA)
    sign_out userA
    get new_event_path
    assert_response :redirect
  end

  test "User can view dashboard if logged in" do
    userA = users(:userValidA)
    get user_path(userA)
    assert_response :success
  end

  test "User can edit their information" do
    userA = users(:userValidA)
    post events_path, params: { event: { user_id: userA.id, event_name: 'Main Event', event_description: 'Main Event Description', event_start_date: Date.tomorrow(), event_start_time: Time.now }}
    assert_response :redirect
    follow_redirect!
    
    eventA = Event.last

    patch edit_event_path(eventA), params: { event: { user_id: userA.id, event_name: 'Sub Event', event_description: 'Sub Event Description', event_start_date: Date.tomorrow(), event_start_time: Time.now }}
    assert_response :redirect
    follow_redirect!

    assert_equal 'Sub Event', eventA.event_name
  end

  # test "invalid account" do
  #   assert_raise (Exception) {
  #     user = User.new(:password=>"ABCSDS231",:first_name=>"hello")
  # }
    
  #   # no fields - should return an exception since none of the fields are filled out
  # end
  # test "edit account" do
  #     user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"cry",:password_confirmation=>"ABCSDS231",:admin=>false)
  #     assert user.valid?
  # end
  #  test "inv reg wrong email" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmail.com",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
  #   assert user.valid?
  # end
  # test "inv reg mismatch password" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS234234231",:admin=>false)
  #   assert user.valid?
  # end
  # test "user exists" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
  #   user2 = User.find(:email => "ssekar+0000.gmu.edu")
  #   assert user==user2
  # end
  # test "valid login" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
  #   username = "ssekar+0000@gmu.edu"
  #   password = "ABCSDS231"
  #   boolean = (user.email == username) and (user.password == password)
  #   assert boolean
  # end
  # test "invalid login" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
  #   username = "ssekar+0000@gmu.edu"
  #   password = "ABCSDS2323421"
  #   boolean = (user.email == username) and (user.password == password)
  #   assert_not boolean
  # end
  # test "logged in" do
    
  # end

  # test "logged out" do
    
  # end

  # test "remembered" do
    
  # end
  # test "is admin" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
  #   assert user.is_admin == false
  # end
  
  # test "delete user" do
  #   user = User.new(:password=>"ABCSDS231",:email=>"ssekar+00000@gmu.edu",:first_name=>"hello",:last_name=>"crazy",:password_confirmation=>"ABCSDS231",:admin=>false)
     
  #   # Need to write assertion
  # end
  # test "update user" do

  # end 
end
