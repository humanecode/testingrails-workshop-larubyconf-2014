require 'test_helper'

class User::CreateTest < ActiveSupport::TestCase
  def test_create_1_record
    begin_count = User.count
    random = SecureRandom.hex(8)
    User.create! email: "#{random}@example.com",
                 password: random,
                 password_confirmation: random
    assert_equal begin_count + 1, User.count
  end
end
