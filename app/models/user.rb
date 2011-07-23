class User < ActiveRecord::Base
  acts_as_authentic

  has_friendly_id :login, :use_slug => true

  include Gravtastic
  gravtastic

  has_many :ssh_keys
  has_many :rights
  has_many :aq_repositories, :through => :rights
  has_many :aq_commits, :foreign_key => "author_id", :order => "committed_time DESC"
  has_one :role

  after_create :set_initial_role

  validates_presence_of :login, :email, :password
  # TODO how to i18n this ?
  validates_format_of :name, :with => /^[A-Z][a-zA-Z '&-]*[A-Za-z]$/i, :allow_blank => true, :message => "can only contains letters and numbers."
  validates_format_of :login, :with => /^\w+$/i, :message => "can only contains letters and numbers."
  validates_uniqueness_of :name, :case_sensitive => true
  validates_uniqueness_of :email, :case_sensitive => true
  validates_exclusion_of :name, :in => ["admin", "login", "logout"], :message => "name %{value} is reserved"

  def set_initial_role
    self.create_role(:name => "user", :user_id => self.id)
    self.role.save
  end

  # TODO FIXME
  def admin?
    return (self.role.name == "admin")
  end

end
