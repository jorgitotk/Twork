module Front
  class WorkGroupsController < FrontController
    before_action :set_work_group, only: [:show, :edit, :update, :destroy, :add_member]
    before_action :new_member, only: [:destroy_member, :members_management]

    def index
      @groups = UserHasGroup.groups(current_user)
      @group = WorkGroup.new
    end

    def new
      @work_group = WorkGroup.new
    end

    def edit
      @group = WorkGroup.new
    end

    def show
    end

    def create
      @work_group = WorkGroup.new(work_group_params)
      @work_group.owner = current_user.id
      if @work_group.valid?
        @work_group.save
      end
    end

    def update
      if @work_group.update(work_group_params)
        redirect_to admin_work_group_path(@work_group)
      end
    end

    def destroy
      @work_group.destroy
      redirect_to admin_work_groups_path
    end

    def members_management
      @group = WorkGroup.find(params[:id])
    end

    def destroy_member
      @group = WorkGroup.find(params[:id])
      member = UserHasGroup.find_by(work_group_id: params[:group_id], user_id: params[:member_id])
      member.destroy
    end

    def add_member
      @member = @work_group.user_has_groups.new(member_params)
      unless User.find_by(id: member_params[:user_id]).nil?
        @member.save
      end
    end

    private
      def set_work_group
        @work_group = WorkGroup.find(params[:id])
      end

      def new_member
        @member = UserHasGroup.new        
      end

      def work_group_params
        params.require(:work_group).permit(:name, :description)
      end

      def member_params
        params.require(:user_has_group).permit(:user_id)
      end
  end

end