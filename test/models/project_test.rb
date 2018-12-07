require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test "should not save project without title" do
    project = Project.new
    assert_not project.save
  end

  test "should save project with title" do
    project = Project.new(title: "faketitle")
    assert project.save
  end

  test "should not save project with the same title" do
    project = Project.new(title: "fake")
    assert project.save

    project = Project.new(title: "fake")
    assert_not project.save
  end



end
