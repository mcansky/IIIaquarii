require 'grit'
include Grit

class AqRepositoriesController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :view_file, :show_commits, :show_commit]
  before_filter :check_private_repository, :except => [:index, :new, :create]
  before_filter :warning_no_sshkey, :only => [:new, :create, :show]

  def index
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    @user = User.find(params[:user_id])
    if current_user
      @repositories = current_user.aq_repositories.paginate :page => page, :per_page => Settings.pagination.user_repositories
    else
      @repositories = @user.aq_repositories.public.paginate :page => page, :per_page => Settings.pagination.user_repositories
    end
  end

  def show
    @repository = AqRepository.find(params[:id])
    if @repository.is_git?
      @grit_repo = Repo.new(@repository.path)
    end
  end

  def new
    @repository = AqRepository.new
    @user = current_user
  end

  def create
    @repository = AqRepository.new(params[:aq_repository])
    @repository.owner = current_user
    if @repository.save
      flash[:notice] = t(:repo_create_ok)
      redirect_to [@repository.owner, @repository]
    else
      flash[:notice] = t(:repo_create_ko)
      redirect_to aq_repositories
    end
  end

  def edit
    @repository = AqRepository.find(params[:id])
    if @repository.owner != current_user
      @repository = nil
      flash[:notice] = t(:insufficient_rights)
      redirect_to root_path
    end
    @user = @repository.owner
  end

  def update
    @repository = AqRepository.find(params[:id])
    if @repository.rights.size == 0
      @repository.owner = current_user
    end
    if @repository.update_attributes(params[:aq_repository])
      flash[:notice] = t(:repo_update_ok)
      redirect_to [@repository.owner, @repository]
    else
      render :action => 'edit'
    end
  end

  def destroy
    repository = AqRepository.find(params[:id])
    repository.destroy
    flash[:notice] = t(:repo_destroy_ok)
    redirect_to aq_repositories_path
  end

  def join
    repository = AqRepository.find(params[:id])
    if !repository.users.include?(current_user)
      a_right = Right.new
      a_right.role = "c"
      a_right.right = "r"
      a_right.status = "p"
      a_right.user = current_user
      repository.rights << a_right
      repository.save
    end
    redirect_to repository
  end

  def fork
    parent_repo = AqRepository.find(params[:id])
    repository = AqRepository.new
    repository.fork(parent_repo)
    repository.save if repository
    redirect_to repository
  end

  def view_file
    @repository = AqRepository.find(params[:id])
    if @repository.is_git?
      @grit_repo = Repo.new(@repository.path)
    end
  end

  def show_commits
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    branch = "master"
    branch = params[:branch] if params[:branch]

    @repository = AqRepository.find(params[:id])
    if @repository.is_git?
      @grit_repo = Repo.new(@repository.path)
    end


    @commits = WillPaginate::Collection.create(page, Settings.pagination.commits, @grit_repo.commit_count(branch)) do |pager|
      start = (page.to_i-1)*Settings.pagination.commits # Assuming "current_page" is 1 based.
      pager.replace(@grit_repo.commits(branch, Settings.pagination.commits, start)) # branch, max to show, start at (skips)
    end

  end

  def show_commit
    @repository = AqRepository.find(params[:id])
    if @repository.is_git?
      @grit_repo = Repo.new(@repository.path)
    end
  end

end
