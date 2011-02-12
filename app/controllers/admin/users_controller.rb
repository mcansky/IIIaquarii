class Admin::UsersController < ApplicationController
  before_filter :login_required
  before_filter :admin_required

  def index
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    @users = User.paginate :page => page, :per_page => Settings.admin.pagination.users
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.confirm!
      @user.send_reset_password_instructions
      flash[:notice] = t(:created, :scope => [:admin, :users])
      redirect_to admin_users_url
    else
      render :action => :new
    end
  end

  def make_admin
    user = User.find(params[:id])
    if user.id == current_user.id
      flash[:error] = t(:refused, :scope => [:admin, :users, :change_role])
      return redirect_to admin_users_url
    end
    user.role.name = "admin"
    user.role.save
    flash[:notice] = t(:role_changed, :scope => [:admin, :users, :change_role], :to_role => "admin", :from_role => "user", :user => user.login)
    return redirect_to admin_users_url
  end

  def make_user
    user = User.find(params[:id])
    if user.id == current_user.id
      flash[:error] = t(:refused, :scope => [:admin, :users, :change_role])
      return redirect_to admin_users_url
    end
    user.role.name = "user"
    user.role.save
    flash[:notice] = t(:role_changed, :scope => [:admin, :users, :change_role], :to_role => "user", :from_role => "admin", :user => user.login)
    return redirect_to admin_users_url
  end
end
