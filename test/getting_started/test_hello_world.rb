require "minitest/autorun"

class HelloWorld
  def greet
    "Hello world!"
  end
end

class HelloWorldTest < MiniTest::Unit::TestCase
  def test_greeting
    assert_equal "Hello world!", HelloWorld.new.greet
  end
end
