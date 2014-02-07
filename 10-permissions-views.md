Permissions in Views
====================

Now that we have cool permission checks, how about we use them!

Questions
---------

Do we have test coverage for changing the templates?

This makes our controllers much more complicated!

How can we manage this complexity?

* Idea: Extract permissions to its own object for easier tests!

We have just complicated our controller tests.

* Member vs. Nonmember
* Member with post vs. Member without post
* Logged in vs. Anonymous user

Exercises
---------

Add the following calls to PermissionsHelper in the following templates:

1. `can_create_post?` in `posts/index.html.erb`
2. `can_create_comment?` in `posts/show.html.erb`


Write separate PostsController tests for the following conditions:

1. Member with a post for the day
2. Member without a post for the day
3. Nonmember
4. Anonymous
