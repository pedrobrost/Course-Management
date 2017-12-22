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

  test "year should not be too distant" do
    @course.year = 3000
    assert_not @course.save
  end

  test "year should not be a string" do
    @course.year = "dos mil cuatro"
    assert_not @course.save
  end

  test 'should not destroy if it has students or exams' do
    assert_not courses(:one).destroy
  end

  test 'should destroy if it is empty' do
    assert courses(:two).destroy
  end

  test 'year should be unique' do
    course1 = Course.new
    course2 = Course.new
    course1.year = 2020
    course2.year = 2020
    course1.save
    assert_not course2.save
  end

  test "should not have students" do
    assert_not courses(:two).has_students?
  end

  test "should have students" do
    assert courses(:one).has_students?
  end
  
end
