class Right < ActiveRecord::Base
  belongs_to :user
  belongs_to :aq_repository
  #belongs_to :ssh_key

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
