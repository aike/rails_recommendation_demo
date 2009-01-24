require 'test_helper'

class BookmarksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookmarks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post :create, :bookmark => { }
    end

    assert_redirected_to bookmark_path(assigns(:bookmark))
  end

  test "should show bookmark" do
    get :show, :id => bookmarks(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bookmarks(:one).id
    assert_response :success
  end

  test "should update bookmark" do
    put :update, :id => bookmarks(:one).id, :bookmark => { }
    assert_redirected_to bookmark_path(assigns(:bookmark))
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete :destroy, :id => bookmarks(:one).id
    end

    assert_redirected_to bookmarks_path
  end
end
