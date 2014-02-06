require 'test_helper'

class User::AuthenticationTest < ActiveSupport::TestCase
  def test_authenticates_password
    user = users :mike
    # All test data users have a password
    # same as the symbol used to retrieve them
    assert user.authenticate("mike"),
           "User cannot authenticate. Perhaps user does not have password set properly in fixture?"
  end

  def test_authenticate_email_and_password
    user = users :mike
    found = User.authenticate user.email, "mike"
    refute_nil found, "User.authenticate should never return nil."
    assert_predicate found, :valid?,
                     "User.authenticate did not return a valid user record when expected. Password change in fixture?"
  end

  def test_authenticate_good_email_bad_password
    user = users :mike
    found = User.authenticate user.email, "mike".reverse
    refute_nil found, "User.authenticate should never return nil."
    refute_predicate found, :valid?,
                     "Expecting an invalid record with a bad password, but got valid record instead."
  end

  def test_authenticate_bad_email
    found = User.authenticate "dontexist@example.com", "nope"
    refute_nil found, "User.authenticate should never return nil."
    refute_predicate found, :valid?,
                     "Expecting an invalid record with a bad password, but got valid record instead."
  end

end
