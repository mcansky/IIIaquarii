class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :login_required
  before_filter :set_our_current_user

  def index
  end

  # We need to access to "current_user" from some models
  # and we can't with Devise, so we use this workaroud
  def set_our_current_user
    User.our_current_user = current_user || nil
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
