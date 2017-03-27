class Admin::GeneralViewController < AdminController

  def index
    @work_groups = WorkGroup.own_groups current_user
  end

  def view_tasks
    @group =WorkGroup.find_by id: params[:id]
    if @group
      @future_tasks = @group.tasks.future
      @in_progress_tasks = @group.tasks.in_progress
      @done_tasks = @group.tasks.done
    end
    @comment = Comment.new
    @file_task = FileTask.new
  end

  def destroy_comment
    comment = Comment.find_by id: params[:comment_id]
    comment.destroy unless comment.blank?
    @task = Task.find_by id: params[:task_id]
  end

end
