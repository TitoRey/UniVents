require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid registration" do
    
  end

  test "inv reg missing field" do
    user = User.new
    assert_not user.save
  end
  test "inv reg weak password" do
    user = User.new
    user.password="hey"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="hey"
    user.admin=false
    user.user_id=1
    assert_not user.save
  end
  ''' test "inv reg wrong email" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmail.com"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS231"
    user.admin=false
    user.user_id=1
    assert_not user.save
  end
  test "inv reg mismatch password" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS23232342341"
    user.admin=false
    user.user_id=1
    assert_not user.save
  end
  test "user exists" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS231"
    user.admin=false
    user.user_id=1
    user.save
    user2 = User.find(email = "ssekar+0000.gmu.edu")
    assert user2 == user
  end
  test "valid login" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS231"
    user.admin=false
    user.user_id=1
    user.save
    username = "ssekar+0000@gmu.edu"
    password = "ABCSDS231"
    assert user.email = username and user.password = password
  end
  test "invalid login" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS231"
    user.admin=false
    user.user_id=1
    user.save
    username = "ssekar+0000@gmu.edu"
    password = "ABCSDS2323421"
    assert_not user.email = username and user.password = password
  end
  test "logged in" do
    
  end

  test "logged out" do
    
  end

  test "remembered" do
    
  end
  test "is admin" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS231"
    user.admin=true
    user.user_id=1
    user.save
    assert user.is_admin == true
  end
  test "is active" do
    user=User.new
    user.password="ABCSDS231"
    user.email = "ssekar+0000@gmu.edu"
    user.first_name="hello"
    user.last_name="crazy"
    user.password_confirmation="ABCSDS231"
    user.admin=false
    user.user_id=1
    user.active = true
    user.save
    assert user.active == true
  end
  test "delete user" do
    
  end
  test "update user" do
    
  end '''
end
