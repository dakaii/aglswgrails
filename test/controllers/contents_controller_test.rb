require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest

  test "show action should return success" do
    get "/projects/#{Project.last.id}/contents"
    assert_response :success
  end

  test "create action should return unauthorized without token" do
    post "/projects/#{Project.last.id}/contents"
    assert_response :unauthorized
  end

  test "create action should return success with valid inputs" do
    post "/projects/#{Project.last.id}/contents",
    params: { content: {
      title: 'haha',
      type: 'area'}
    },
    headers: authenticated_header(User.first)
    assert_response :success
  end

  test "create action should return bad request with existing title" do
    post "/projects/#{Project.last.id}/contents",
    params: { content: {
      title: Content.first.title,
      type: 'area'}
    },
    headers: authenticated_header(User.first)
    assert_response :bad_request
  end

  test "create action should return bad request without type" do
    post "/projects/#{Project.last.id}/contents",
    params: { content: {
      title: 'haha'}
    },
    headers: authenticated_header(User.first)
    assert_response :bad_request
  end

  test "update action should not work if not owner" do
    patch "/contents/#{Content.first.id}",
    params: { content: {
      title: 'haha'}
    },
    headers: authenticated_header(User.first)
    assert_response :forbidden
  end

  test "destroy action should not work if not owner" do
    assert_difference('Project.count', 0) do
      delete "/contents/#{Content.last.id}",
      headers: authenticated_header(User.last)
      assert_response :forbidden
    end
  end

  test "update action should work without type" do
    content = Content.last
    patch "/contents/#{content.id}",
    params: { content: {
      title: 'haha'}
    },
    headers: authenticated_header(User.find(content.user_id))
    assert_response :ok
  end

  test "update action should work without title" do
    content = Content.last
    owner = User.find(content.user_id)
    patch "/contents/#{content.id}",
    params: { content: {
      type: 'length'}
    },
    headers: authenticated_header(owner)
    assert_response :ok
  end

  test "destroy action should work" do
    content = Content.last
    owner = User.find(content.user_id)
    assert_difference('Project.count', 0) do
      delete "/contents/#{content.id}",
      headers: authenticated_header(owner)
      assert_response :no_content
    end
  end

end
