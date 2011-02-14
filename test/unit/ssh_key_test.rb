require 'test_helper'

class SshKeyTest < ActiveSupport::TestCase
  should belong_to(:user)
  should validate_presence_of(:name)
  should ensure_length_of(:name).is_at_most(50)
  should validate_presence_of(:key)
end
