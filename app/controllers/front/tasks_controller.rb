module Front
  class TasksController < FrontController
  	before_action	:set_tasks

    def index
    	@future_tasks = @tasks.future
    	@in_progress_tasks = @tasks.in_progress
    	@done_tasks = @tasks.done
      @comment = Comment.new
    end

    private

    	def set_tasks
    		@tasks = current_user.tasks
    	end

  end
end