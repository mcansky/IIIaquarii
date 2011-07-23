class UsersController < ApplicationController
  before_filter :require_user, :except => [:show, :new, :create, :index]

  def index
    @users = User.page(params[:page])
  end

  def new
    @app_title = "New user"
    @user = User.new
  end

  def create
    @app_title = "New user"
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User created."
      redirect_to @user
    else
      render :action => 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_repositories = @user.aq_repositories.public
  end

  def edit
    @app_title = "Edit user"
    @user = User.find(params[:id])
    redirect_to root_url if current_user != @user
  end

  def update
    @app_title = "Update user"
    @user = User.find(params[:id])
    @commits = @user.aq_commits.of_public_repositories

    redirect_to root_url if current_user != @user

    if @user.update_attributes(params[:user])
      flash[:notice] = "User updated."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    redirect_to root_url if current_user != @user
    @user.destroy
    flash[:notice] = "User removed."
    redirect_to root_url
  end

end
