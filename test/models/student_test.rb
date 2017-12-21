require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  test "should assert 8.9 score for exam" do
    assert_equal(8.9, students(:one).score_for(exams(:one)))
  end

  test "should assert attended to exam" do
    assert students(:one).attended_to?(exams(:one))
  end

  test "should not assert attended to exam" do
    assert_not students(:four).attended_to?(exams(:one))
  end

  test "should assert exam approved" do
    assert students(:one).passed?(exams(:two))
  end

  test "should not assert exam approved" do
    assert_not students(:one).passed?(exams(:one))
  end

end
