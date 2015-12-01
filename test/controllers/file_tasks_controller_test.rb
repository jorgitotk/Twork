require 'test_helper'

class FileTasksControllerTest < ActionController::TestCase
  setup do
    @file_task = file_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_task" do
    assert_difference('FileTask.count') do
      post :create, file_task: { image: @file_task.image, title: @file_task.title }
    end

    assert_redirected_to file_task_path(assigns(:file_task))
  end

  test "should show file_task" do
    get :show, id: @file_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_task
    assert_response :success
  end

  test "should update file_task" do
    patch :update, id: @file_task, file_task: { image: @file_task.image, title: @file_task.title }
    assert_redirected_to file_task_path(assigns(:file_task))
  end

  test "should destroy file_task" do
    assert_difference('FileTask.count', -1) do
      delete :destroy, id: @file_task
    end

    assert_redirected_to file_tasks_path
  end
end
