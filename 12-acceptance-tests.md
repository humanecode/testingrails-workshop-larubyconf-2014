Acceptance Testing
==================

There are limitations of controller tests. You can't create a test that spans multiple controllers. For instance, let's suppose you want to write a test that visits the homepage, logs a user in, and then revisits the homepage and assert that something has changed.

ActionDispatch::IntegrationTest
-------------------------------

    require "test_helper"
     
    class LoginTest < ActionDispatch::IntegrationTest
      def test_navigation_changes_when_logged_in
        get "/" # root_path
        assert_response :success
        assert_match /Login/, response.body
        refute_match /Logout/, response.body

        get "/login" # login_path
        assert_response :success
     
        post_via_redirect "/login", username: users(:mike).email, password: "mike"
        assert_equal "/", path # root_url, path
        # assert_equal "Welcome Mike!", flash[:notice]
        refute_match /Login/, response.body
        assert_match /Logout/, response.body
      end
    end

Exercises
---------

1. Create an acceptance test that will log a user in and check navigation
