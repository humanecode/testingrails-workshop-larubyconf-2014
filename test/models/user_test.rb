require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_authenticates_password
    user = users :mike
    # All test data users have a password
    # same as the symbol used to retrieve them
    assert user.authenticate("mike"),
           "User cannot authenticate. Perhaps user does not have password set properly in fixture?"
  end
end
