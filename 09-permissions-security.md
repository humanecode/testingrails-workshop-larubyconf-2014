Permissions and Security
========================

We have a working app! Except it doesn't work all the time...

Let's turn on our Critical QA mind!

* Our tests are missing some API calls we need to use:
    * `Group.find`
    * `Post.find`
    * Empty `Post` for create form
    * Empty `Comment` for create form
* What about editing a post?
* Creating a post when user already has a post
* Creating a post when not logged in

Questions
---------

* Is it the Core or Web layer's job to enforce who can post? (Web vs. Admin?)

ActionView::TestCase
--------------------

* Just the thing to test helpers!

* `assert_template`
* `assert_tag`
* `assert_no_tag`
* `assert_select`
* `assert_select_encoded`
* `assert_select_email`
* `assert_recognizes`
* `assert_generates`
* `assert_routing`
* `assert_response`
* `assert_redirected_to`
* `assert_dom_equal`
* `assert_dom_not_equal`

Exercises
---------

Create `PermissionsHelper#can_create_post(group, user)` and `PermissionsHelper#can_create_comment(post, user)` using TDD.

1. Test that Group members can create posts
2. Test that Group authors (members with a post) cannot create posts
3. Test that Group nonmembers cannot create posts
4. Test that anonymous users (not logged in) cannot create posts
5. Test that Group members can create comments
6. Test that Group authors (members with a post) can create comments
7. Test that Group nonmembers can create comments
8. Test that anonymous users (not logged in) cannot create comments

**Optional** Test who can update a post or comment
