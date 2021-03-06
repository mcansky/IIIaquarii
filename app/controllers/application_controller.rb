class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :login_required, :current_user_session, :current_user
  before_filter :login_required, :only => :admin
  before_filter :admin_required, :only => :admin

  include SentientController

  def index
    # only show 10 repositories and 30 commits on index page
    if current_user
      @repositories = AqRepository.public_with_private_user(current_user.id).limit(10)
    else
      @repositories = AqRepository.public.limit(10)
    end
    @commits = AqCommit.of_public_repositories.order("committed_time DESC").limit(30)
  end

  def repositories
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]

    if current_user
      @repositories = AqRepository.public_with_private_user(current_user.id)
    else
      @repositories = AqRepository.public
    end

    @repositories = @repositories.page(page).per(Settings.pagination.all_repositories)

  end

  def admin
  end

  def check_branch_existancy
    branch = params[:branch] || "master"
    repo = params[:id]

    repo = AqRepository.find(repo)
    branch = repo.branches.find_by_name(branch)

    if !branch and (repo.branches.count > 0)
      return raise ActiveRecord::RecordNotFound
    end
  end

  def warning_no_sshkey
    repository = AqRepository.find(params[:id])
    if current_user
      if current_user.id == repository.owner.id
        if current_user.ssh_keys.size == 0
          flash[:error] = t(:no_ssh_key, :scope => :repositories)
        end
      end
    end
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

  def check_registration_state
    if Settings.application.disable_registration
      flash[:error] = t(:registration_disabled, :scope => :users)
      return redirect_to root_url
    end
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def login_required
    if current_user
      return true
    else
      flash[:notice] = t(:login_required, :scope => :users)
      redirect_to new_user_session_url
    end # if current_user
  end # def login_required

  def admin_required
    if !current_user.admin?
      flash[:error] = t(:admin_perms_needed, :scope => :users)
      return redirect_to root_url
    end
  end
end
