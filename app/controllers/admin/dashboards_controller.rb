class Admin::DashboardsController < Admin::BaseController
  def index
    @users_count = User.count
    @boards_count = Board.count 
  end
end