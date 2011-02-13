require 'grit'
include Grit

class AqRepositoriesController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :view_file, :show_commits, :show_commit, :view_raw_file]
  before_filter :check_private_repository, :except => [:index, :new, :create]
  before_filter :warning_no_sshkey, :only => [:show, :update, :edit]
  before_filter :check_branch_existancy, :except => [:new, :create, :update, :destroy, :index]

  def index
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    @user = User.find(params[:user_id])
    if current_user
      if current_user.id == @user.id
        @repositories = current_user.aq_repositories.paginate :page => page, :per_page => Settings.pagination.user_repositories
      else
        @repositories = @user.aq_repositories.public.paginate :page => page, :per_page => Settings.pagination.user_repositories
      end
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
    @user = current_user
    @repository = AqRepository.new(params[:aq_repository])
    @repository.owner = current_user
    if @repository.save
      flash[:notice] = t(:created, :scope => :repositories)
      redirect_to [@repository.owner, @repository]
    else
      flash[:notice] = t(:error_creating, :scope => :repositories)
      render :action => :new
    end
  end

  def edit
    @repository = AqRepository.find(params[:id])
    if @repository.owner != current_user
      @repository = nil
      flash[:notice] = t(:insufficient_rights, :scope => :repositories)
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
      flash[:notice] = t(:updated, :scope => :repositories)
      redirect_to [@repository.owner, @repository]
    else
      render :action => 'edit'
    end
  end

  def destroy
    repository = AqRepository.find(params[:id])
    repository.destroy
    flash[:notice] = t(:destroyed, :scope => :repositories)
    redirect_to user_aq_repositories_path(current_user)
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
    redirect_to user_aq_repository_url(current_user, repository)
  end

  def fork
    parent_repo = AqRepository.find(params[:id])
    repository = AqRepository.new
    repository.fork(parent_repo)
    repository.save if repository
    redirect_to user_aq_repository_url(current_user, repository)
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

  def view_raw_file
    branch = "master"
    branch = params[:branch] if params[:branch]
    fpath = params[:file_path]
    repository = AqRepository.find(params[:id])
    if repository.is_git?
      grit_repo = Repo.new(repository.path)
    end
    a_file = grit_repo.tree(branch) / fpath
    raise ActiveRecord::RecordNotFound if !a_file
    response.headers["Content-Type"] = "text/plain"
    render :text => a_file.data
  end

end
