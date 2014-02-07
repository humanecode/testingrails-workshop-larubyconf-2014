require "test_helper"

describe GroupsController do
  it "lists groups" do
    get :index
    assert_response :success
  end
end
