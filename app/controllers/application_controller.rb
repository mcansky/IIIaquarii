class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :login_required
  before_filter :set_our_current_user

  def index
    @repositories = AqRepository.find(:all)
    @commits = AqCommit.find(:all, :order => "committed_time DESC")
  end

  def repositories
    render :text => "TODO"
  end

  # We need to access to "current_user" from some models
  # and we can't with Devise, so we use this workaroud
  def set_our_current_user
    User.our_current_user = current_user || nil
  end

  def check_private_repository
    repository = AqRepository.find(params[:id])

    user_id = (current_user ? current_user.id : nil)

    if repository
      if (repository.is_private?) and (repository.owner.id != user_id)
        return redirect_to root_url
      else
        return true
      end
    else
      return redirect_to root_url
    end

  end

  private
  def login_required
    if current_user
      return true
    else
      flash[:notice] = t(:required, :scope => :login)
      redirect_to new_user_session_url
    end # if current_user
  end # def login_required

end
