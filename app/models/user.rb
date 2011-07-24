class User < ActiveRecord::Base
  include SentientUser
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

  validates_presence_of :login, :email
  # TODO how to i18n this ?
  #validates_format_of :login, :with => /^[A-Z][a-zA-Z '&-]*[A-Za-z]$/i, :allow_blank => false, :message => "can only contains letters and numbers."
  #validates_format_of :login, :with => /^\w+$/i, :message => "can only contains letters and numbers."
  validates_uniqueness_of :login, :case_sensitive => true
  validates_uniqueness_of :email, :case_sensitive => true
  validates_exclusion_of :login, :in => ["admin", "login", "logout"], :message => "name %{value} is reserved"

  def set_initial_role
    self.create_role(:name => "user", :user_id => self.id)
    self.role.save
  end

  # TODO FIXME
  def admin?
    return (self.role.name == "admin")
  end

  def name
    "#{self.firstname if !self.firstname.blank?} #{self.lastname if !self.lastname.blank?}".strip # strip is here to remove the whitespace if no firstname
  end

end
