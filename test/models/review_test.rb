require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @review = Review.new(content: "Lorem ipsum", user_id: @user.id, 
    course:"Practice of Information Systems", year:"2017", semester:"Spring", 
    professor:"Ohshima")
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end
  
  test "content should be present" do
    @review.content = "   "
    assert_not @review.valid?
  end

  test "content should be at most 250 characters" do
    @review.content = "a" * 251
    assert_not @review.valid?
  end
  
  test "course title should be present" do
    @review.course = "   "
    assert_not @review.valid?
  end
 
  test "year should be present" do
    @review.year = "   "
    assert_not @review.valid?
  end
  
  test "semester should be present" do
    @review.semester = "   "
    assert_not @review.valid?
  end
  
  test "professor should be present" do
    @review.professor = "   "
    assert_not @review.valid?
  end
 
  test "order should be most recent first" do
    assert_equal reviews(:most_recent), Review.first
  end
  
end
