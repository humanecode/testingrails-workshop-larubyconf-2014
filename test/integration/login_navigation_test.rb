require "test_helper"

class LoginNavigationTest < ActionDispatch::IntegrationTest
  def test_login_navigation
    get root_path
    assert_response 200 # :success

    assert_includes response.body, "Login"
    refute_includes response.body, "Logout"

    user = users :mike

    post "/login", user: { email: user.email,
                           password: "mike" }

    assert_response :redirect
    follow_redirect!

    # detecting we are logged in
    refute_includes response.body, "Login"
    assert_includes response.body, "Logout"
  end
end
