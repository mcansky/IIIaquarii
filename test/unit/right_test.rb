require 'test_helper'

class RightTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:aq_repository)
  should belong_to(:ssh_key)
end
