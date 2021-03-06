require 'test_helper'

class ResultTest < ActiveSupport::TestCase

  test "should not assert approved" do
    assert_not results(:one).approved?
  end

  test "should assert approved" do
    assert results(:five).approved?
  end

  test 'should not save empty result' do
    result = Result.new
    assert_not result.save
  end

  test 'should not save result with negative score' do
    result = Result.new
    result.score = -55
    assert_not result.save
  end

  test 'should not save result with string score' do
    result = Result.new
    result.score = "five"
    assert_not result.save
  end



end
