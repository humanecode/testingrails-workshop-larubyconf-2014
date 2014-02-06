require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  def group
    @group ||= groups :dev
  end

  def user
    @user ||= users :nonmember
  end

  def membership
    @membership ||= begin
      m = Membership.new
      m.group = group
      m.user = user
      m
    end
  end

  def test_can_be_valid
    assert membership.valid?
  end

  def test_is_invalid_without_group
    membership.group = nil
    refute membership.valid?
    assert_includes membership.errors[:group_id], "can't be blank"
  end

  def test_is_invalid_without_user
    membership.user = nil
    refute membership.valid?
    assert_includes membership.errors[:user_id], "can't be blank"
  end

  def test_invalid_with_duplicate_group_user
    membership = memberships :dev_member
    membership2 = Membership.new
    membership2.group = membership.group
    membership2.user  = membership.user
    refute membership2.valid?
    assert_includes membership2.errors[:user_id], "has already been taken"
  end
end











