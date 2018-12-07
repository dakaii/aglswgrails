require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "index action should return success" do
    get "/projects"
    assert_response :success
  end

  test "create action should return unauthorized without token" do
    post "/projects"
    assert_response :unauthorized
  end

  test "create action should create project" do
    post "/projects",
      params: { project: {
        title: 'test'}
      },
      headers: authenticated_header(User.last)

      assert_response :success
  end

  test "create action should fail with empty title" do
    post "/projects",
      params: { project: {
        title: ''}
      },
      headers: authenticated_header(User.last)

      assert_response :bad_request
  end

end
