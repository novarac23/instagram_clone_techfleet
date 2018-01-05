require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "can see the login page" do
    get "/sessions/new"
    assert_select "h1", "Log in"
  end

  test "can log in with proper credentials" do
    nik = users(:nik)
    get "/sessions/new"

    post "/sessions", params: {user: {email: "nik@techfleet.com", password: "donuts"}}

		assert_response :redirect
		follow_redirect!
		assert_response :success
		assert_select "h1", "All Photos"
  end
end
