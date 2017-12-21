require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @course = Course.new
  end

  test 'should not save empty course' do
    assert_not @course.save
  end

  test "year should not be too old" do
    @course.year = 1899
    assert_not @course.save
  end

  test "year should not be a string" do
    @course.year = "dos mil cuatro"
    assert_not @course.save
  end

  test "should not have students" do
    assert_not courses(:two).has_students?
  end

  test "should have students" do
    assert courses(:one).has_students?
  end
  
end
