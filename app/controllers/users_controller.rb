class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user
      @user_repositories = current_user.aq_repositories
    else
      @user_repositories = @user.aq_repositories.public
    end
  end

  def feed_repositories
    @user = User.find(params[:id])

    respond_to do |format|
      format.atom
    end
  end

  def feed_commits
    @user = User.find(params[:id])
    @commits = @user.aq_commits.of_public_repositories

    respond_to do |format|
      format.atom
    end
  end
end
