class SshKeysController < ApplicationController
  before_filter :login_required

  def index
    @keys = current_user.ssh_keys
  end

  def show
    @key = SshKey.find(params[:id])
    if @key.user != current_user
      flash[:notice] = t(:not_owner, :sshkeys)
      @key = nil
      redirect_to root_url
    end
  end # def show

  def new
    @key = SshKey.new
    keys_size = current_user.ssh_keys.size
    @key.name = "another key #{keys_size}" if keys_size > 0
  end # def new

  def create
    @key = SshKey.new(params[:ssh_key])
    @key.user = current_user
    @key.extract_login # TODO move to model in post_save
    if @key.save
      flash[:notice] = t(:created, :scope => :sshkeys)
      redirect_to @key
    else
      render :action => 'new'
    end
  end # def create

  def edit
    @key = SshKey.find(params[:id])
    if @key.user != current_user
      flash[:notice] = t(:not_owner, :scope => :sshkeys)
      @key = nil
      redirect_to root_url
    end
  end # def edit

  def update
    @key = SshKey.find(params[:id])
    if @key.user == current_user
      if @key.update_attributes(params[:ssh_key])
        @key.extract_login # TODO move to model in post_save
        flash[:notice] = t(:updated, :scope => :sshkeys)
        redirect_to @key
      else
        render :action => 'edit'
      end
    else
      flash[:notice] = t(:not_owner, :scope => :sshkeys)
    end
  end # def update

  def destroy
    @key = SshKey.find(params[:id])
    @key.destroy
    flash[:notice] = t(:destroyed, :scope => :sshkeys)
    redirect_to ssh_keys_url
  end

  private
  def export
    @key = SshKey.find(params[:id])
    @key.export_to_sys
    redirect_to ssh_keys_url
  end

end
