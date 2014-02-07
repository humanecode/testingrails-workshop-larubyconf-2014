require 'test_helper'

class Group::MembershipTest < ActiveSupport::TestCase
  def test_if_a_user_is_a_member
    group = groups :dev
    assert group.is_member?(users :member)
    refute group.is_member?(users :nonmember)
  end

  def test_adding_a_new_member
    group = groups :dev
    user = users :nonmember
    refute group.is_member?(user)
    group.add_member user
    assert group.is_member?(user)
  end

  def test_adding_an_existing_member_is_noop
    group = groups :dev
    user = users :member
    assert group.is_member?(user)
    group.add_member user
    assert group.is_member?(user)
  end

  def test_removing_a_member
    group = groups :dev
    user = users :member
    assert group.is_member?(user)
    group.remove_member user
    refute group.is_member?(user)
  end

  def test_removing_a_nonmember_is_noop
    group = groups :dev
    user = users :nonmember
    refute group.is_member?(user)
    group.remove_member user
    refute group.is_member?(user)
  end

end
