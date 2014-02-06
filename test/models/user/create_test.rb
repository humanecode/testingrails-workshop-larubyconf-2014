require 'test_helper'

class User::CreateTest < ActiveSupport::TestCase
  def test_create_1_record
    begin_count = User.count
    create_random_user
    assert_equal begin_count + 1, User.count
  end

  def create_random_user
    random = SecureRandom.hex(8)
    User.create! email: "#{random}@example.com",
                 password: random,
                 password_confirmation: random
  end
end
