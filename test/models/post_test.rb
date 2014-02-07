require 'test_helper'

describe Post do
  let(:group) { groups :dev }
  let(:user)   { users :member }
  let(:day)   { Date.today }
  let(:post) do
    p = Post.new
    p.group = group
    p.user = user
    p.date = day
    p.body = "Great day!"
    p
  end

  it "can be valid" do
    assert post.valid?
    post.must_be :valid?
  end

  it "is invalid without a group" do
    post.group = nil
    post.wont_be :valid?
    post.errors[:group_id].must_include "can't be blank"
  end

  it "is invalid without a user" do
    post.user = nil
    post.wont_be :valid?
    post.errors[:user_id].must_include "can't be blank"
  end

  it "is invalid without a date" do
    post.date = nil
    post.wont_be :valid?
    post.errors[:date].must_include "can't be blank"
  end

  it "is invalid without a body" do
    post.body = nil
    post.wont_be :valid?
    post.errors[:body].must_include "can't be blank"
  end

  it "is invalid with a duplicate group/user/date" do
    post = posts :today
    post2 = Post.new
    post2.group = post.group
    post2.user  = post.user
    post2.date  = post.date
    post2.body  = post.body

    post2.wont_be :valid?
    post2.errors[:user_id].must_include "has already been taken"
  end

  # Add a new comment: Post#add_comment(user, body)

  it "can add a new comment" do
    post = posts :today
    user = users :nonmember
    assert_difference "Comment.count" do
      post.add_comment user, "New Comment!"
    end
    # lambda do
    #   post.add_comment user, "New Comment!"
    # end.must_change "New Comment!"
  end
end
