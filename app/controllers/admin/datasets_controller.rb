module Admin
  class DatasetsController < AdminController
    def users
      @users = User.search_name(params[:query])
    end
    def members
      @members = User.search_name(params[:query],params[:group])
    end
  end
end