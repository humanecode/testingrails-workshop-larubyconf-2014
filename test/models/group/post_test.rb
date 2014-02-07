require "test_helper"

class Group::PostTest < ActiveSupport::TestCase
  # Retrieve the posts for a given day: Group#posts_for(date)

  def group
    @group ||= groups :dev
  end

  def test_gets_post_for_today
    post = posts :today
    user = users :author
    today = Time.zone.today
    assert_includes group.posts_for(today), post
  end

  def test_gets_post_for_yesterday
    post = posts :today
    user = users :author
    yesterday = Time.zone.today.yesterday
    refute_includes group.posts_for(yesterday), post
  end

  # Retrieve a post for a given user and day: Group#post_for(user, date)

  def test_get_a_post_by_user_date
    post = posts :today
    user = users :author
    today = Time.zone.today
    assert_equal post, group.post_for(user, today)
  end

  def test_returns_nil_post_by_user_date
    post = posts :today
    user = users :nonmember
    today = Time.zone.today
    assert_nil group.post_for(user, today)
  end

  # Add a new post: Group#add_post(user, date, body)

  def test_can_add_a_new_post
    assert_difference "Post.count" do
      group.add_post users(:member), Time.zone.today, "New Post!"
    end
  end
end
