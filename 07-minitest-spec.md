Minitest's Spec DSL
===================

In your Gemfile:

    gem "minitest-rails"
    
In your `test/test_helper.rb`:

    require "minitest/rails"

MiniTest's Spec DSL maps the following:

* `describe` creates a Test Class
* `it` creates a Test Method
* `must_*` methods call `assert_*` assertions ([expectations](http://ruby-doc.org/stdlib-2.1.0/libdoc/minitest/spec/rdoc/MiniTest/Expectations.html))
* `before` calls `setup`
* `let` is supported for other helper methods

In your test:

    describe Post do            -> class PostTest < ActiveSupport::TestCase
      let :post do              ->   def post
        @post ||= posts :today  ->     @post ||= posts :today
      end                       ->   end
                                -> 
      before do                 ->   def setup
        @date = Time.zone.today ->     @date = Time.zone.today
      end                       ->   end
                                -> 
      it "can be valid" do      ->   def test_can_be_valid
        post.must_be :valid?    ->     assert post.valid?
      end                       ->   end
    end                         -> end                                      

Nested "context" vs. Separate Tests
-----------------------------------

Instead of nesting contexts in one monolithic test file, consider separate files by context.

`class Group::MembershipTest < ActiveSupport::TestCase`

vs.

`describe Group, :memberhip do`

Exercises
---------

1. Add minitest-rails to Gemfile
2. Choose a test and convert it to the spec DSL.
