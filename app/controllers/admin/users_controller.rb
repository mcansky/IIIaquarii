class Admin::UsersController < ApplicationController
  before_filter :login_required
  before_filter :admin_required

  def index
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    @users = User.paginate :page => page, :per_page => Settings.admin.pagination.users
  end
end
