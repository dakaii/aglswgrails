require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save user without name" do
    user = User.new
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new(
      password: '',
      email: 'test@test.com',
      name: 'testname'
    )
    assert_not user.save
  end

  test "should not save user with invalid email" do
    user = User.new(
      password: 'testpassword',
      email: '@test.com',
      name: 'testname'
    )
    assert_not user.save
  end

  test "should save user with name email and password" do
    user = User.new(
      password: 'testpassword',
      email: 'testmail@test.com',
      name: 'testname'
    )
    assert user.save
  end
  
end
