require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    @idea = @user.ideas.create(name: "MyString",
      description: "Description",
      additional_info: "Additional info",
      platform_id: 1,
      role_ids: [1]
    )

    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show idea" do
    get :show, id: @idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea
    assert_response :success
  end

  test "should update idea" do
    patch :update, id: @idea, idea: { name: @idea.name, role_ids: [1] }
    assert_redirected_to idea_path(@idea)
  end

  test "should destroy idea" do
    assert_difference('Idea.count', -1) do
      delete :destroy, id: @idea
    end

    assert_redirected_to ideas_path
  end
end
