module Admin
  class CommentsController < AdminController
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :set_task

    def index
      @comments = Comment.all
    end

    def show
    end

    def new
      @comment = Comment.new
    end

    def edit
    end

    def create
      @comment = current_user.comments.new(comment_params)
      @comment.task = @task
      @comment.save
    end

    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to admin_general_view_index_path, notice: 'Comment was successfully updated.' }
        end
      end
    end

    def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to admin_general_view_index_path, notice: 'Comment was successfully destroyed.' }
      end
    end

    private

      def set_task
        @task = Task.find(params[:task_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:user_id, :task_id, :body)
      end
  end
end
