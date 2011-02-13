class SshKey < ActiveRecord::Base
  belongs_to :user

  validates :name, :presence => true, :length => { :maximum => 50 }
  validates_presence_of :name, :key

  before_validation :is_valid?

  # Wrapper around valid method for validation
  def is_valid?
    if not self.valid
      errors.add_to_base "Invalid SSH Key !"
    end
  end

  # extract the login from the pasted key and insert it in the db
  def extract_login
    if self.valid
      key_pieces = self.key.split(" ")
      self.login = key_pieces[2] if key_pieces.size == 3
    end
  end # def extract_login

  # return the ssh key (without the username@host)
  def short
    if self.valid
      key_pieces = self.key.split(" ")
      return key_pieces[0] + " " + key_pieces[1]
    end
  end # def short

  # check validity of the key
  def valid
    if self.key
      key_pieces = self.key.split(" ")
      if key_pieces.size < 2
        return false
      end
      small_key = key_pieces[0] + " " + key_pieces[1]
      #if small_key =~ /^(ssh-\w+ [a-zA-Z0-9\/\+]+==?).*$/
      if small_key =~ /^(ssh-\w+ [a-zA-Z0-9\/\+].*)$/
        return true
      else
        return false
      end
    else
      return false
    end
  end # def valid

  # prepare the command for the export to the filesystem
  def command
    if self.valid
      command = ["command=\"#{Rails.root}/#{Settings.shell.path} #{self.login}\"",
                 "no-port-forwarding", "no-X11-forwarding", "no-agent-forwarding"]
      command.join(",")
    end
  end

  # export ready return
  def export
    if self.valid
      ssh_line = "#{command} #{self.short}"
      #ssh_line = "#{self.short}"
      return ssh_line
    end
  end

end
