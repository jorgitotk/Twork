module Front
  class TasksController < FrontController
  	before_action	:set_tasks

    def index
    	@future_tasks = @tasks.future
    	@in_progress_tasks = @tasks.in_progress
    	@done_tasks = @tasks.done
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

    private

    	def set_tasks
    		@tasks = current_user.tasks
    	end

  end
end