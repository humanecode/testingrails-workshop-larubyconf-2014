Capybara DSL & Providers
========================

Spec DSL
--------

Did you know Capybara has a Spec DSL too?

The generators support creating Capybara tests with the Spec DSL.

JavaScript Provider
-------------------

By default, Capybara simulates a browser, but doesn't actually run the JavaScript. But when using a JavaScript provider the tests will run in a browser located on a different thread, and that messes with the database transaction. RSpec uses DatabaseCleaner because of this, but there are several advantages to stay with the ActiveSupport DB transaction if we can.

Exercises
---------

1. Add "poltergeist" to Gemfile
2. Add the following to `test_helper.rb`
3. Test post creation inline form using JavaScript
4. Test comment creation inline form using JavaScript

Test Helper
-----------

    # Capybara driver
    Capybara.javascript_driver = :poltergeist

    # Make all database transactions use the same thread
    ActiveRecord::ConnectionAdapters::ConnectionPool.class_eval do
      def current_connection_id
        Thread.main.object_id
      end
    end
