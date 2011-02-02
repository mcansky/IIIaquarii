class User < ActiveRecord::Base
  cattr_accessor :our_current_user
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :login

  has_friendly_id :login, :use_slug => true

  include Gravtastic
  gravtastic

  has_many :ssh_keys
  has_many :rights
  has_many :aq_repositories, :through => :rights
  has_many :aq_commits, :foreign_key => "author_id", :order => "committed_time DESC"

  before_validation :set_initial_name

  validates_presence_of :login, :email, :password, :name
  # TODO how to i18n this ?
  validates_format_of :name, :with => /^[A-Z][a-zA-Z '&-]*[A-Za-z]$/i, :message => "can only contains letters and numbers."
  validates_format_of :login, :with => /^\w+$/i, :allow_blank => true, :message => "can only contains letters and numbers."
  validates_uniqueness_of :name, :case_sensitive => true
  validates_uniqueness_of :email, :case_sensitive => true

  # TODO FIXME setting some initial name as devise seems to misunderstand if we put that in the registration form
  def set_initial_name
    self.name = self.login if self.name.blank?
  end
end
