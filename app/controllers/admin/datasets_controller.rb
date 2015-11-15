module Admin
  class DatasetsController < AdminController
    def users
      p params[:query]
      @users = User.search_name(params[:query])
    end
  end
end