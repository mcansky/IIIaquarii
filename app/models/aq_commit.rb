class AqCommit < ActiveRecord::Base
  belongs_to :branch, :class_name => "AqBranch", :foreign_key => "aq_branch_id"
  belongs_to :repository, :class_name => "AqRepository", :foreign_key => "aq_repository_id"
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  has_and_belongs_to_many :aq_files

  scope :repositories_with_visibility, lambda { |vis|
    joins(:repository).
    where("aq_repositories.visibility = ?", vis).
    group("aq_commits.id")
  }

  scope :of_public_repositories, repositories_with_visibility(0)
  scope :of_private_repositories, repositories_with_visibility(1)

  def purge
    true
  end
end
