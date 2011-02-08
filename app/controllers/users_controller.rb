class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if current_user
      @user_repositories = current_user.aq_repositories
    else
      @user_repositories = @user.aq_repositories.public
    end
  end
end
