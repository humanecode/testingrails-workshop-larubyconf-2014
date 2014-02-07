require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def group
    @group ||= groups :dev
  end

  def user
    @user ||= users :member
  end

  def day
    Date.today
  end

  def post
    @post ||= begin
      p = Post.new
      p.group = group
      p.user = user
      p.date = day
      p.body = "Great day!"
      p
    end
  end

  def test_can_be_valid
    assert post.valid?
  end

  def test_is_invalid_without_group
    post.group = nil
    refute post.valid?
    assert_includes post.errors[:group_id], "can't be blank"
  end

  def test_is_invalid_without_user
    post.user = nil
    refute post.valid?
    assert_includes post.errors[:user_id], "can't be blank"
  end

  def test_is_invalid_without_day
    post.date = nil
    refute post.valid?
    assert_includes post.errors[:date], "can't be blank"
  end

  def test_is_invalid_without_day
    post.body = nil
    refute post.valid?
    assert_includes post.errors[:body], "can't be blank"
  end

  def test_invalid_with_duplicate_group_user_date
    post = posts :today
    post2 = Post.new
    post2.group = post.group
    post2.user  = post.user
    post2.date  = post.date
    post2.body  = post.body
    refute post2.valid?
    assert_includes post2.errors[:user_id], "has already been taken"
  end

  # Add a new comment: Post#add_comment(user, body)

  def test_can_add_a_new_comment
    post = posts :today
    user = users :nonmember
    assert_difference "Comment.count" do
      post.add_comment user, "New Comment!"
    end
  end
end
