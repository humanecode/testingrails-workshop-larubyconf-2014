require "test_helper"

describe PermissionsHelper do

  def current_user
    @current_user
  end

  it "member can create a post" do
    @group = groups :dev
    @date = Time.zone.today
    @current_user = users :member
    assert can_create_post?
  end

  it "author cannot create a post" do
    @group = groups :dev
    @date = Time.zone.today
    @current_user = users :author
    refute can_create_post?
  end

  it "nonmember cannot create a post" do
    @group = groups :dev
    @date = Time.zone.today
    @current_user = users :nonmember
    refute can_create_post?
  end

  it "anonymous cannot create a post" do
    @group = groups :dev
    @date = Time.zone.today
    @current_user = nil
    refute can_create_post?
  end

end
