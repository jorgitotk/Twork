module Admin
  class GeneralViewController < AdminController

    def index
    	@work_groups = WorkGroup.own_groups(current_user)
    end

    def view_tasks
    	@group =WorkGroup.find(params[:id])
    	@future_tasks = @group.tasks.future
    	@in_progress_tasks = @group.tasks.in_progress
    	@done_tasks = @group.tasks.done
      @comment = Comment.new
      @file_task = FileTask.new
    end

    def destroy_comment
      comment = Comment.find(params[:comment_id])
      unless comment.blank?
        comment.destroy
      end
      @task = Task.find(params[:task_id])
    end

  end
end