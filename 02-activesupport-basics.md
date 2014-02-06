ActiveSupport::TestCase Basics
==============================

`test_helper` provides test structure
-------------------------------------

ActiveSupport::TestCase is the basis of all Rails tests
-------------------------------------------------------

ActiveSupport::TestCase provides DB transactions
------------------------------------------------

ActiveSupport::TestCase has several new assertions
--------------------------------------------------

* `assert_raise`
* `assert_not_empty`
* `assert_not_equal`
* `assert_not_in_delta`
* `assert_not_in_epsilon`
* `assert_not_includes`
* `assert_not_instance_of`
* `assert_not_kind_of`
* `assert_no_match`
* `assert_not_nil`
* `assert_not_operator`
* `assert_not_predicate`
* `assert_not_respond_to`
* `assert_not_same`
* `assert_nothing_raised`
* `assert_deprecated`
* `assert_not_deprecated`
* `assert_not`
* `assert_difference`
* `assert_no_difference`
* `assert_blank`
* `assert_present`

The main one is `assert_difference`:

    assert_difference "User.count" do
      random = SecureRandom.hex(8)
      User.create! email: "#{random}@example.com",
                   password: random,
                   password_confirmation: random
    end

Exercises
---------

In User::CreateTest file (test/models/user/create_test.rb)

Create the following test methods, check the user count before and after creating the user records:

`git checkout ex2.2`

1. `test_create_1_user`
2. `test_create_3_users`
3. `test_create_10_users`
