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

end
