require 'pathname'
require 'grit'
include Grit
include ActionView::Helpers::TextHelper

class AqRepository < ActiveRecord::Base
  before_save :repo_path
  after_save :repo_init
  after_save :repo_set_visibility

  has_friendly_id :name, :use_slug => true

  has_many :rights
  has_many :users, :through => :rights
  has_many :branches, :class_name => "AqBranch"
  has_many :commits, :class_name => "AqCommit", :through => :branches, :order => "committed_time"
  has_many :forks, :class_name => "AqRepository", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "AqRepository", :foreign_key => "parent_id"
  has_many :files, :class_name => "AqFile", :foreign_key => "aq_repository_id"

  scope :public,  { :conditions => ['visibility = ?', 0] }
  scope :private, { :conditions => ['visibility = ?', 1] }

  def owner
    a_right = self.rights.find(:all, :conditions => ["role = ?", 'o']).first
    if a_right
      owner = a_right.user
    else
      owner = nil
    end # if a_right
  end # def owner

  def owner=(user)
    a_right = Right.new
    a_right.user = user
    a_right.aq_repository = self
    a_right.right = 'w'
    a_right.role  = 'o'
    self.rights << a_right
    a_right.save
  end# def owner=(user)

  def committers
    some_rights = self.rights.find(:all, :conditions => ["role = ? AND status != ?", 'c', 'p'])
    r_committers = []
    some_rights.each do |a_right|
      r_committers << a_right.user
    end
    return r_committers
  end # def committers

  def have_public_clone?
    Settings.git.have_public_clone
  end

  def public_path
    if self.is_git?
      split_path = self.path.split("/")
      ppath = "git://" + Settings.application.hostname + "/" +
        split_path[-2] + "/" + split_path[-1]
    end # if self.is_git?
  end # def public_path

  def private_path
    if self.is_git?
      split_path = self.path.split("/")
      ppath = Settings.repos.repo_user + "@" + Settings.application.hostname + ":" +
        split_path[-2] + "/" + split_path[-1]
    end # if self.is_git?
  end # def private_path

  def is_git?
    return (self.kind == "git")
  end

  def is_private?
    return (self.visibility == 1)
  end

  def repo_update
    self.grit_update if self.is_git?
    self.hg_update if self.is_hg?
  end

  # Update branches stored in DB
  def grit_update
    grit_repo = Repo.new(self.path)
    count = 0
    grit_repo.branches.each do |b|
      self.branches << AqBranch.new(:name => b.name) if not self.branches.find_by_name(b.name)
    end
    self.branches.each do |b|
      b.grit_update
      count += 1
    end
    aq_logger(Settings.logs.scm, "User #{self.owner.login}, Repository: #{self.name}, #{count} branches treated.")
    self.save
  end # def grit_update // Update branches stored in DB

  # Purge branches stored in DB
  def purge
    self.branches.each do |b|
      b.purge
      b.destroy
    end
  end # def purge

  def orphan_files
    self.files.find(:all, :conditions => ["aq_branch_id = ?", nil])
  end

  def file(path)
    self.files.find_by_path(path)
  end

  def branch(name)
    self.branches.find_by_name(name)
  end

  # Generate the repo path
  # Check config/settings.yml for setup
  def repo_path
    # root dir is the system home folder, need to exist prior to app launch
    # e.g. /home
    root_dir = Pathname(Settings.repos.root_dir)

    # base dir is aq_git user home folder, need to exist prior to app launch
    # e.g. /home/aq_git

    base_dir = root_dir + Settings.repos.repo_user

    if self.kind == "git"
      repo_path = Settings.git.repo_path
    end

    # git dir is where the repositories are gonna be stored, creating if needed
    # e.g. /home/aq_git/git or /home/aq_git/hg
    scm_dir = base_dir + repo_path
    scm_dir.mkdir if base_dir.exist? && !scm_dir.exist?

    # repo dir is the repository own path
    # e.g. /home/aq_git/git/username
    if self.owner
      repo_dir = scm_dir + self.owner.login
    elsif User.our_current_user
      repo_dir = scm_dir + User.our_current_user.login
    end
    repo_dir.mkdir if !repo_dir.exist?

    # the dot dir is the .git (or .hg) located in the repository
    # e.g. /home/aq_git/git/username/some_repo.git
    if self.is_git?
      dot_dir = repo_dir + (self.name + ".#{self.kind}")
      dot_dir.mkdir if !dot_dir.exist?
    end

    self.path = dot_dir.to_s
  end # def repo_path // Generate the repo path

  def fork(parent_repo)
    if !User.our_current_user.aq_repositories.find_by_name(parent_repo.name)
      self.name = parent_repo.name
      self.kind = parent_repo.kind
      self.repo_path
      system("cp -r #{parent_repo.path}/* #{self.path}")
      self.parent = parent_repo
      self.owner = User.our_current_user
      self.repo_update
    else
      redirect_to parent_repo
    end
  end # def fork

  def aq_logger(logfile, message)
    File.open(Rails.root + "log/" + logfile, "a") do |log|
      log.puts Time.now.strftime("%d/%m/%y %H:%M ") + message
    end
  end # def aq_logger(logfile, message)


  def short_desc(length=80)
    truncate(self.desc, :length => length, :omission => '...')
  end






  private
  # Initialize the repository
  def repo_init
    if self.kind == "git"
      git_repo_init
    end
  end # def repo_init

  def git_repo_init
    File.umask(0001)
    dirs = {
      "hooks" => nil,
      "info" => nil,
      "objects" => { "info" => nil, "pack" => nil },
      "refs" => { "heads" => nil, "tags" => nil }}
    files = ["HEAD", "config", "description"]

    dot_git = Pathname(self.path)

    # Create the dirs
    l_mkdirs(dot_git, dirs)

    # Create base files
    bare = true
    files.each do |l_file|
      if !File.exist?("#{dot_git}/#{l_file}")
        File.open("#{dot_git}/#{l_file}", "a") do |file_out|
          template_dir = "templates"
          template_dir += "-bare" if bare
          IO.foreach("#{Rails.root}/config/#{template_dir}/#{l_file}") {  |w| file_out.puts(w) }
        end
      end
    end
  end # def git_repo_init

  # l_mkdirs method creates dirs using a hash
  #
  # root is a pathname object
  # dir_hash is a hash containing dirs to create in root
  # if subdirs need to be created in those then the key points to another hash
  def l_mkdirs(root, dir_hash)
    dir_hash.each_key do |s_dir|
      Dir.mkdir(root + s_dir) if !(root + s_dir).exist?
      l_mkdirs(root + s_dir, dir_hash[s_dir]) if dir_hash[s_dir]
    end
  end

  # Set the repo visibility (public or private)
  def repo_set_visibility
    if self.kind == "git"
      repo_set_git_visibility
    end
  end

  # Set the visibility of the repo by git-daemon
  # If repo is public we 'touch REPO_PATH.git/git-daemon-export-ok'
  # else not.
  # 0 = public
  # 1 = private
  def repo_set_git_visibility
    File.umask(0001)
    file_export = "git-daemon-export-ok"

    dot_git = Pathname(self.path)

    if self.visibility == 0
      # 0 / public
      f = File.open(dot_git + file_export, "w")
      f.close()
    else
      if File.exist?(dot_git + file_export)
        File.delete(dot_git + file_export)
      end
    end
  end # def repo_set_git_visibility (public or private using git-daemon-export-ok file)


end
