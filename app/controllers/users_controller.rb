class UsersController < ApplicationController
  def show
    # TODO
    @user = User.find(params[:id])
  end
end
