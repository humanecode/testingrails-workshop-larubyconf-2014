require 'test_helper'

class User::ValidTest < ActiveSupport::TestCase
  def test_can_be_valid
    mike = users :mike
    assert_valid mike
  end

  def test_invalid_without_email
    mike = users :mike
    mike.email = nil
    refute_valid mike
    assert_includes mike.errors[:email], "can't be blank"
  end

  def assert_valid user
    assert_predicate user, :valid?
  end

  def refute_valid user
    refute_predicate user, :valid?
  end
end
