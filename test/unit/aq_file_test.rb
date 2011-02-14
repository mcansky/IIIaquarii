require 'test_helper'

class AqFileTest < ActiveSupport::TestCase
  should belong_to(:branch)
  should belong_to(:repository)
end
