class Admin::TasksController < AdminController

  before_action :set_group, only: [:tasks_management, :adding_task, :edit_task, :add_member, :destroy_assigned_member]
  before_action :set_task, only: [:add_member, :destroy_comment, :destroy_assigned_member]

  def index
    @own_groups = WorkGroup.own_groups current_user
  end

  def tasks_management
    @new_task = Task.new
  end

  def adding_task
    @new_task = Task.new task_params
    @new_task.work_group_id = @group.id
    @new_task.save if @new_task.valid?
  end

  def destroy_task
    @group = WorkGroup.find_by id: params[:group_id]
    current_task = Task.find_by id: params[:task_id]
    current_task.destroy if current_task
  end

  def add_member
    member = UserHasGroup.find_by work_group_id: @group.id, user_id: params[:user_id]
    if member
      assigned_task = AssignedTask.new
      assigned_task.task_id = params[:task_id]
      assigned_task.user_has_group_id = member.id
      assigned_task.save
    end
    @task_id = params[:task_id]
  end

  def edit_task
    @group = WorkGroup.find_by id: params[:group_id]
    current_task = Task.find_by id: params[:task_id]
    current_task.update(task_params) if current_task.valid?
  end

  def update_status
    @file_task = FileTask.new
    @comment = Comment.new
    @task = Task.find_by id: params[:id]
    @group = @task.work_group
    work_group_hash = Hash.new
    ap work_group_hash
    work_group_hash["status"] = params[:status].to_i
    @task.update work_group_hash
    @future_tasks = @group.tasks.future
    @in_progress_tasks = @group.tasks.in_progress
    @done_tasks = @group.tasks.done
  end

  def destroy_comment
    comment = Comment.find_by id: params[:comment_id]
    comment.destroy unless comment.blank?
  end

  def destroy_assigned_member
    member = UserHasGroup.find_by work_group_id: @group.id, user_id: params[:user_id]
    if member
      assigned_task = AssignedTask.find_by task_id: params[:task_id], user_has_group_id: member.id
      assigned_task.destroy if assigned_task
    end
  end

  private

  def set_group
    @group = WorkGroup.find params[:id]
  end

  def set_task
    @task = Task.find_by id: params[:task_id]
  end

  def task_params
    params.require(:task).permit(:name, :description, :start_time, :end_time, :work_group_id)
  end

end
