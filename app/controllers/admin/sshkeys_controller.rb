class Admin::SshkeysController < ApplicationController
  before_filter :login_required
  before_filter :admin_required

  def index
    page = (!params[:page] or (params[:page] == "0")) ? 1 : params[:page]
    @ssh_keys = SshKey.paginate :page => page, :per_page => Settings.admin.pagination.ssh_keys
  end

  def edit
    @ssh_key = SshKey.find(params[:id])
  end

  def update
    @ssh_key = SshKey.find(params[:id])
    if @ssh_key.update_attributes(params[:ssh_key])
      flash[:notice] = t(:updated, :scope => [:admin, :ssh_keys])
      redirect_to admin_sshkeys_url
    else
      render :action => :edit
    end
  end

  def destroy
    sshkey = SshKey.find(params[:id])
    sshkey.destroy
    flash[:notice] = t(:destroyed, :scope => [:admin, :ssh_keys])
    redirect_to admin_sshkeys_url
  end

end
