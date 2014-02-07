require "test_helper"

describe GroupsController do
  it "lists groups" do
    get :index
    assert_response :success
  end

  it "lists posts for a group" do
    get :show, id: groups(:dev)
    assert_response :success
    # show today post, but not show yesterday post
    today = posts :today
    yesterday = posts :yesterday
    response.body.must_include today.body
    response.body.wont_include yesterday.body
  end

  it "lists posts for a group for today" do
    get :show, id: groups(:dev), date: Time.zone.today.to_s
    assert_response :success
    # show today post, but not show yesterday post
    today = posts :today
    yesterday = posts :yesterday
    response.body.must_include today.body
    response.body.wont_include yesterday.body
  end

  it "lists posts for a group for yesterday" do
    today = posts :today
    yesterday = posts :yesterday
    get :show, id: groups(:dev), date: yesterday.date
    assert_response :success
    # show today post, but not show yesterday post
    response.body.wont_include today.body
    response.body.must_include yesterday.body
  end

  it "will handle a bad date value" do
    get :show, id: groups(:dev), date: "SUPERMAN"
    assert_redirected_to group_path(groups(:dev))
  end

  it "show gives a 404 for no group" do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, id: -1
    end
  end
end
