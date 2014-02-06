require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def test_can_be_valid
    group = groups :dev
    assert group.valid?
  end

  def test_invalid_without_name
    group = groups :dev
    group.name = nil
    refute group.valid?
    assert_includes group.errors[:name], "can't be blank"
  end
end
