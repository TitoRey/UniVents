require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.destroy_all
    @admin = User.create(email: 'admin@gmu.edu', password: 'Password1234!', first_name: 'Test', last_name: 'User', admin: true)
    @user = User.create(email: 'test@gmu.edu', password: 'Password1234!', first_name: 'Test', last_name: 'User', admin: false)
  end

  test "user can login" do 
    post user_session_url, params: { user: { email: @admin.email, password: @admin.password, commit: 'Log in' } }
    follow_redirect!
    assert_response :success
  end

  test "user can create an account" do 
    assert_difference "User.count" do 
      post user_registration_url, params: { user: {"first_name"=>"Bella", "last_name"=>"Morante", "email"=>"bella@gmu.edu", "password"=>"Password123!", "password_confirmation"=>"Password123!"} } 
    end
  end

  test "should get index" do
    post user_session_url, params: { user: { email: @admin.email, password: @admin.password, commit: 'Log in' } }
    get users_url
    assert_response :success
  end

  test "should show user" do
    post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update event" do
    post user_session_url, params: { user: { email: @user.email, password: @user.password, commit: 'Log in' } }
    patch user_url(@user), params: { user: { email: @user.email, password: @user.password, first_name: 'Changed', last_name: @user.last_name, admin: false, active: true} }
    user = User.find(@user.id)
    follow_redirect!
    assert_includes response.body, 'Account has been successfully updated!'
    assert_equal user.first_name, 'Changed'
  end

end