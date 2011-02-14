require 'test_helper'

class SshKeyTest < ActiveSupport::TestCase
  should belong_to(:user)
  should validate_presence_of(:name)
  should ensure_length_of(:name).is_at_most(50)
  should validate_presence_of(:key)

  VALID_KEY = File.open(File.expand_path("../../key_id_dsa_valid.pub", __FILE__), "r").read.chomp
  INVALID_KEY = File.open(File.expand_path("../../key_id_dsa_invalid.pub", __FILE__), "r").read.chomp

  def test_key_validity
    key = SshKey.new(:key => VALID_KEY, :name => "valid key")
    assert_equal(true, key.valid)

    key = SshKey.new(:key => INVALID_KEY, :name => "invalid key")
    assert_equal(false, key.valid)
  end

  def test_key_export
    key = SshKey.new(:key => VALID_KEY, :name => "valid key")
    expected_command = ["command=\"#{Rails.root}/#{Settings.shell.path} #{key.login}\"",
                        "no-port-forwarding", "no-X11-forwarding", "no-agent-forwarding"].join(",")
    expected_result = "#{expected_command} #{key.short}"
    assert_equal(expected_result.strip, key.export.strip)

    key = SshKey.new(:key => INVALID_KEY, :name => "valid key")
    assert_equal(nil, key.export)
  end

end
