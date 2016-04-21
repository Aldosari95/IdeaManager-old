require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should NOT create user because duplicate email" do
    user_count = User.count

    post :create, user: { admin: @user.admin, email: @user.email, name: @user.name, password: @user.password, role_id: @user.role_id }

    assert_equal(user_count, User.count)
    assert_response :success
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { admin: @user.admin, email: @user.email, name: @user.name, password: @user.password, role_id: @user.role_id }
    assert_response :success
  end

  test "should destroy user" do
    @second_user = users(:two)
    assert_difference('User.count', -1) do
      delete :destroy, id: @second_user
    end

    assert_redirected_to users_path
  end
end
