module Admin
  class TasksController < AdminController

    before_action :set_group, only:[:tasks_management, :adding_task]

    def index
      @own_groups = WorkGroup.own_groups(current_user)
    end

    def tasks_management
      @new_task = Task.new
    end

    def adding_task
      @new_task = Task.new(task_params)
      @new_task.work_group_id = @group.id
      if @new_task.valid?
        @new_task.save
      end
    end

    def destroy_task
      @group = WorkGroup.find(params[:group_id])
      current_task = Task.find(params[:task_id])
      current_task.destroy if current_task
    end

    private

      def set_group
        @group = WorkGroup.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:name, :description, :start_time, :end_time, :work_group_id)
      end

  end  
end