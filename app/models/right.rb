class Right < ActiveRecord::Base
  belongs_to :user
  belongs_to :aq_repository
  belongs_to :ssh_key

  # Return user repositories (public AND private !)
  scope :current_user_repos, lambda{ |user_id|
    where(:role => 'o', :user_id => user_id)
  }

  def pending?
    return (self.status == "p")
  end

  def accepted?
    return (self.status == "a")
  end

  def rejected?
    return (self.status == "r")
  end
end
