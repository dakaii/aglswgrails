require 'test_helper'

class ContentTest < ActiveSupport::TestCase

  test "should not save content without title" do
    content = Content.new
    assert_not content.save
  end

  test "should not initialize content with invalid type" do
    assert_raises(ArgumentError) do
      content = Content.new(
        project_id: Project.first.id,
        user_id: User.last.id,
        title: 'faketitle',
        type: 7
      )
    end
  end

  test "should not save content without project_id" do
    content = Content.new(
      user_id: User.last.id,
      title: 'faketitle',
      type: 3
    )
    assert_not content.save
  end

  test "should not save content without user_id" do
    content = Content.new(
      project_id: Project.first.id,
      title: 'faketitle',
      type: 4
    )
    assert_not content.save
  end

  test "should not save content without type" do
    content = Content.new(
      project_id: Project.first.id,
      user_id: User.last.id,
      title: 'faketitle',
    )
    assert_not content.save
  end

  test "should save content with valid inputs" do
    content = Content.new(
      project_id: Project.first.id,
      user_id: User.last.id,
      title: 'faketitle',
      type: 'length'
    )
    assert content.save
  end

end
