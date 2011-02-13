class Admin::RepositoriesController < ApplicationController
  before_filter :login_required
  before_filter :admin_required

  def index
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    @repositories = AqRepository.paginate :page => page, :per_page => Settings.admin.pagination.repositories
  end

  def edit
    @repository = AqRepository.find(params[:id])
  end

  def update
    @repository = AqRepository.find(params[:id])
    if @repository.update_attributes(params[:aq_repository])
      flash[:notice] = t(:updated, :scope => [:admin, :repositories])
      redirect_to admin_repositories_url
    else
      render :action => :edit
    end
  end

  def destroy
    repository = AqRepository.find(params[:id])
    repository.destroy
    flash[:notice] = t(:destroyed, :scope => [:admin, :repositories])
    redirect_to admin_repositories_url
  end
end
