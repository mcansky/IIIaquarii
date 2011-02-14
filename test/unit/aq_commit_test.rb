require 'test_helper'

class AqCommitTest < ActiveSupport::TestCase
  should belong_to(:branch)
  should belong_to(:repository)
  should belong_to(:author)
end
