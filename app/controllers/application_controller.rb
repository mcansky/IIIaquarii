class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :login_required

  def index
  end

  private
  def login_required
    if current_user
      return true
    else
      flash[:notice] = t(:required, :scope => :login)
      # TODO implement
      #redirect_to login_path
    end # if current_user
  end # def login_required

end
