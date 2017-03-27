class FileTasksController < ApplicationController

  layout 'front'
  before_action :set_file_task, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  def index
    @file_tasks = FileTask.all
  end

  def show
  end

  def new
    @file_task = FileTask.new
  end

  def edit
  end

  def create
    @file_task = FileTask.new file_task_params
    @file_task.save
  end

  def update
    if @file_task.update file_task_params
      redirect_to @file_task, notice: 'File task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @file_task.destroy
    redirect_to file_tasks_url, notice: 'File task was successfully destroyed.'
  end

  private

  def set_file_task
    @file_task = FileTask.find params[:id]
  end

  def file_task_params
    params.require(:file_task).permit(:image, :title, :task_id, :user_id)
  end

end
