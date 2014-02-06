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

  def test_invalid_with_existing_email
    mike = users :mike
    mike2 = User.create email: mike.email,
                        password: "mike2",
                        password_confirmation: "mike2"
    refute_valid mike2
    assert_includes mike2.errors[:email], "has already been taken"
  end

  def assert_valid user
    assert_predicate user, :valid?
  end

  def refute_valid user
    refute_predicate user, :valid?
  end
end
