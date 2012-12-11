require 'test_helper'

class TumblrsControllerTest < ActionController::TestCase
  setup do
    @tumblr = tumblrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tumblrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tumblr" do
    assert_difference('Tumblr.count') do
      post :create, tumblr: { followers: @tumblr.followers, title: @tumblr.title, total_notes: @tumblr.total_notes, total_posts: @tumblr.total_posts, url: @tumblr.url }
    end

    assert_redirected_to tumblr_path(assigns(:tumblr))
  end

  test "should show tumblr" do
    get :show, id: @tumblr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tumblr
    assert_response :success
  end

  test "should update tumblr" do
    put :update, id: @tumblr, tumblr: { followers: @tumblr.followers, title: @tumblr.title, total_notes: @tumblr.total_notes, total_posts: @tumblr.total_posts, url: @tumblr.url }
    assert_redirected_to tumblr_path(assigns(:tumblr))
  end

  test "should destroy tumblr" do
    assert_difference('Tumblr.count', -1) do
      delete :destroy, id: @tumblr
    end

    assert_redirected_to tumblrs_path
  end
end
