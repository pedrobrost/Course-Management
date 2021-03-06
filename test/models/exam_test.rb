require 'test_helper'

class ExamTest < ActiveSupport::TestCase

  test "should assert zero approved" do
    assert_equal(0, exams(:one).approved)
  end

  test "should assert two approved" do
    assert_equal(2, exams(:two).approved)
  end

  test "should assert three failed" do
    assert_equal(3, exams(:one).failed)
  end

  test "should assert two failed" do
    assert_equal(2, exams(:two).failed)
  end

  test "should assert zero absent students" do
    assert_equal(0, exams(:two).absent_students)
  end

  test "should assert one absent students" do
    assert_equal(1, exams(:one).absent_students)
  end

  test "should assert zero approved percentage" do
    assert_equal(0, exams(:one).approved_percentage)
  end

  test "should assert 50 approved percentage" do
    assert_equal(50, exams(:two).approved_percentage)
  end

  test 'should not save empty exam' do
    exam = Exam.new
    assert_not exam.save
  end

  test 'should not save negative minimum' do
    exam = Exam.new
    exam.minimum = -44
    assert_not exam.save
  end

  test 'should not destroy exam if it has scores' do
    assert_not exams(:one).destroy
  end

  test 'should destroy exam if it has not scores' do
    assert_not exams(:two).destroy
  end

end
