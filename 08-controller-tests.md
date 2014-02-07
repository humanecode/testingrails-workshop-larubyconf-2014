Controller Tests
================

So far we have focused on the domain models. We haven't built any UI. Let's move out away from the domain and into the presentation tier.

[Standup Mocks](standup-mocks.pdf)

What is the purpose of controller tests?
----------------------------------------

unit vs. integration vs. acceptance

ROI of each test type, cost curves over time

Which is a controller test?

Freedom to implement since we already have the domain API

Controller responsibilities
---------------------------

* authentication
* authorization
* talk http
* manipulate model
* manipulate database
* query database
* present models
* manipulate view context (flash)
* create response content (json)
* route (redirect_to)
* choose content-type
* contain model logic

(from https://www.youtube.com/watch?v=iUe6tacW3JE&t=6m33s)

How Does ActionController::TestCase Work?
-----------------------------------------

[Rails documentation](http://api.rubyonrails.org/classes/ActionController/TestCase.html)

ActionController::TestCase Assertions
-------------------------------------

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
* `assert_template`

But what is most useful for a controller test to tell us?

Exercises
---------

Create a Groups controller, with an index and a show action. Drive the code using tests, using test data from fixtures.

**Hint** Check out `ApplicationController#current_user` for how controllers determine which user is logged in.

1. Test that groups#index displays a list of groups
2. Test that groups#show displays a list of posts
3. Test that groups#show displays posts for date in the querystring
4. Test that groups#show will redirect when given a bad date

Create a Posts controller, and a nested Comments controller

5. Test that posts#show displays a post
6. Test that posts#show displays a list of comments
7. Test that posts#create creates a new post
8. Test that comments#create creates a new comment
