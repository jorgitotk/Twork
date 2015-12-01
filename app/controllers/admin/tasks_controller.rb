module Admin
  class TasksController < AdminController

    before_action :set_group, only:[:tasks_management, :adding_task, :edit_task, :add_member, :destroy_assigned_member]

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

    def add_member
      member = UserHasGroup.find_by(work_group_id: @group.id, user_id: params[:user_id])
      if member
        assigned_task = AssignedTask.new
        assigned_task.task_id = params[:task_id]
        assigned_task.user_has_group_id = member.id
        assigned_task.save
      end
      @task_id = params[:task_id]
      @task = Task.find(params[:task_id])
    end

    def edit_task
      @group = WorkGroup.find(params[:group_id])
      current_task = Task.find(params[:task_id])
      if current_task.valid?
        current_task.update(task_params)
      end
    end

    def update_status
      @file_task = FileTask.new
      @comment = Comment.new
      @task = Task.find(params[:id])
      @group = @task.work_group
      a = Hash.new
      a["status"] = params[:status].to_i
      @task.update(a)
      @future_tasks = @group.tasks.future
      @in_progress_tasks = @group.tasks.in_progress
      @done_tasks = @group.tasks.done
    end

    def destroy_comment
      comment = Comment.find(params[:comment_id])
      unless comment.blank?
        comment.destroy
      end
      @task = Task.find(params[:task_id])
    end

    def destroy_assigned_member
      member = UserHasGroup.find_by(work_group_id: @group.id, user_id: params[:user_id])
      if member
        assigned_task = AssignedTask.find_by(task_id: params[:task_id], user_has_group_id: member.id)
        if assigned_task
          assigned_task.destroy
        end
      end
      @task = Task.find(params[:task_id])
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