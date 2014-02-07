Acceptance Testing with Capybara
================================

It would be nice to follow the DOM rather than have our tests know about the URLs for creating a new post. This is where Capybara comes in. Instead of simulating a client, Capybara will actually run the app as a client.

Navigating
----------

You can use the visit method to navigate to other pages:

    visit "/projects"
    visit post_comments_path post

The visit method only takes a single parameter, the request method is always GET.

You can get the current path of the browsing session for test assertions:

    assert_equal current_path, post_comments_path post

Clicking links and buttons
--------------------------

You can interact with the webapp by following links and buttons. Capybara automatically follows any redirects, and submits forms associated with buttons.

    click_link "id-of-link"
    click_link "Link Text"
    click_button "Save"
    click_on "Link Text" # clicks on either links or buttons
    click_on "Button Value"

Interacting with forms
----------------------

There are a number of tools for interacting with form elements:

    fill_in "First Name", :with => "John"
    fill_in "Password", :with => "Seekrit"
    fill_in "Description", :with => "Really Long Text..."
    choose "A Radio Button"
    check "A Checkbox"
    uncheck "A Checkbox"
    attach_file "Image", "/path/to/image.jpg"
    select "Option", :from => "Select Box"

Querying
--------

Capybara has a rich set of options for querying the page for the existence of certain elements, and working with and manipulating those elements.

    page.has_selector? "table tr"
    page.has_selector? :xpath, "//table/tr"

    page.has_xpath? "//table/tr"
    page.has_css? "table tr.foo"
    page.has_content? "foo"

Note: The negative forms like has_no_selector? are different from not has_selector?. Read the section on asynchronous JavaScript for an explanation.

Finding
-------

You can also find specific elements, in order to manipulate them:

    find_field("First Name").value
    find_link("Hello").visible?
    find_button("Send").click

    find(:xpath, "//table/tr").click
    find("#overlay").find("h1").click
    all("a").each { |a| a[:href] }

Note: find will wait for an element to appear on the page, as explained in the Ajax section. If the element does not appear it will raise an error.

These elements all have all the Capybara DSL methods available, so you can restrict them to specific parts of the page:

    find("#navigation").click_link "Home"

Scoping
-------

Capybara makes it possible to restrict certain actions, such as interacting with forms or clicking links and buttons, to within a specific area of the page. For this purpose you can use the generic within method. Optionally you can specify which kind of selector to use.

    within "li#employee" do
      fill_in "Name", :with => "Jimmy"
    end

    within :xpath, "//li[@id="employee"]" do
      fill_in "Name", :with => "Jimmy"
    end

There are special methods for restricting the scope to a specific fieldset, identified by either an id or the text of the fieldset"s legend tag, and to a specific table, identified by either id or text of the table"s caption tag.

    within_fieldset "Employee" do
      fill_in "Name", :with => "Jimmy"
    end

    within_table "Employee" do
      fill_in "Name", :with => "Jimmy"
    end

Assertions
----------

You can use these with assertions or expectations:

    assert_selector "table tr"
    assert_selector page, "table tr"
    page.must_have_selector "table tr"

    assert_selector :xpath, "//table/tr"
    assert_selector page, :xpath, "//table/tr"
    page.must_have_selector :xpath, "//table/tr"

    assert_xpath "//table/tr"
    assert_xpath page, "//table/tr"
    page.must_have_xpath "//table/tr"

    assert_css "table tr.foo"
    assert_css page, "table tr.foo"
    page.must_have_css "table tr.foo"

    assert_content "foo"
    assert_content page, "foo"
    page.must_have_content "foo"

So what would our Login test look like using Capybara?

    require "test_helper"
     
    class LoginBrowserTest < Capybara::Rails::TestCase
      def test_navigation_changes_when_logged_in
        visit "/"
        assert_content /Login/
        refute_content /Logout/

        visit "/login"
        fill_in "email",    with: users(:mike).email
        fill_in "password", with: "mike"
        click_link "Sign in"

        assert_equal current_path, "/"
        refute_content /Login/
        assert_content /Logout/
      end
    end

Exercises
---------

1. Add "minitest-rails-capybara" to Gemfile
2. Convert the acceptance test for logging a user in and checking navigation
3. Test Post creation using Capybara
4. Test Comment creation using Capybara
