class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :login_required
  before_filter :set_our_current_user

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
      @repositories = AqRepository.public_with_private_user(current_user.id).paginate :page => page, :per_page => Settings.pagination.all_repositories
    else
      @repositories = AqRepository.public.paginate :page => page, :per_page => Settings.pagination.all_repositories
    end

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

  # We need to access to "current_user" from some models
  # and we can't with Devise, so we use this workaroud
  def set_our_current_user
    User.our_current_user = current_user || nil
  end

  def warning_no_sshkey
    if current_user
      if current_user.ssh_keys.size == 0
        flash[:notice] = t(:no_ssh_key, :scope => :repositories)
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

  private
  def login_required
    if current_user
      return true
    else
      flash[:notice] = t(:login_required, :scope => :users)
      redirect_to new_user_session_url
    end # if current_user
  end # def login_required

end
