require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "signin action should return success" do
    post "/users/signin" ,
    params: { user: {
        email: User.last.email,
        password: 'testpassword'}
    }
    assert_response :success
  end

  test "signup action should fail with existing email" do
    post "/users/signup" ,
    params: { user: {
        name: "test",
        email: User.last.email,
        password: 'testpassword'}
    }
    assert_response :bad_request
  end

  test "signup action should fail without name " do
    post "/users/signup" ,
    params: { user: {
        email: "uniqueemail@email.com",
        password: 'testpassword'}
    }
    assert_response :bad_request
  end

  test "signup action should return success with valid inputs" do
    post "/users/signup" ,
    params: { user: {
        name: "test",
        email: "uniqueemail@email.com",
        password: 'testpassword'}
    }
    assert_response :success
  end

end
