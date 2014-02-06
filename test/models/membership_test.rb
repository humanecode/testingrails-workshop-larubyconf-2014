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
    assert_includes membership.errors[:group], "can't be blank"
  end

  def test_is_invalid_without_user
    membership.user = nil
    refute membership.valid?
    assert_includes membership.errors[:user], "can't be blank"
  end
end
