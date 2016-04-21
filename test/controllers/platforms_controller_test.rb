require 'test_helper'

class PlatformsControllerTest < ActionController::TestCase
  setup do
    @platform = platforms(:one)
    @user = users(:admin)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should NOT create platform because name uniqueness" do
    platform_count = Platform.count
    post :create, platform: { name: @platform.name }
    assert_equal(platform_count, Platform.count)

    assert_response :success
  end

  test "should show platform" do
    get :show, id: @platform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @platform
    assert_response :success
  end

  test "should update platform" do
    patch :update, id: @platform, platform: { name: @platform.name }
    assert_response :success
  end

  test "should destroy platform" do
    assert_difference('Platform.count', -1) do
      delete :destroy, id: @platform
    end

    assert_redirected_to platforms_path
  end
end
