require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  should belong_to(:user)
  should validate_presence_of(:name)
  should validate_presence_of(:user_id)
end
