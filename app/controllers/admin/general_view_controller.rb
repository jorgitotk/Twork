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
    end

  end
end