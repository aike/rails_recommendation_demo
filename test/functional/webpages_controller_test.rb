require 'test_helper'

class WebpagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:webpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create webpage" do
    assert_difference('Webpage.count') do
      post :create, :webpage => { }
    end

    assert_redirected_to webpage_path(assigns(:webpage))
  end

  test "should show webpage" do
    get :show, :id => webpages(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => webpages(:one).id
    assert_response :success
  end

  test "should update webpage" do
    put :update, :id => webpages(:one).id, :webpage => { }
    assert_redirected_to webpage_path(assigns(:webpage))
  end

  test "should destroy webpage" do
    assert_difference('Webpage.count', -1) do
      delete :destroy, :id => webpages(:one).id
    end

    assert_redirected_to webpages_path
  end
end
