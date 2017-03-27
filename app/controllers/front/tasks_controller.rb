class Front::TasksController < FrontController

  before_action :set_tasks

  def index
    @future_tasks = @tasks.future
    @in_progress_tasks = @tasks.in_progress
    @done_tasks = @tasks.done
    @comment = Comment.new
    @file_task = FileTask.new
  end

  def destroy_comment
    comment = Comment.find_by id: params[:comment_id]
    comment.destroy unless comment.blank?
    @task = Task.find_by id: params[:task_id]
  end

  private

  def set_tasks
    @tasks = current_user.tasks
  end

end
