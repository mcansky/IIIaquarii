require 'test_helper'

class ConfigurationTest < ActiveSupport::TestCase
  puts "Testing configuration consistency..."

  def test_application_keys
    assert_equal(false, Settings.application.nil?)

    assert_equal(false, Settings.application.name.blank?)
    assert_equal(false, Settings.application.contact.blank?)
    assert_equal(false, Settings.application.hostname.blank?)
    assert_equal(true, ([true, false].include? Settings.application.disable_registration))
    assert_equal(false, Settings.application.index_msg.blank?)
  end

  def test_pagination_keys
    assert_equal(false, Settings.pagination.nil?)

    assert_equal(true, Settings.pagination.all_repositories.is_a?(Fixnum))
    assert_equal(true, Settings.pagination.user_repositories.is_a?(Fixnum))
    assert_equal(true, Settings.pagination.commits.is_a?(Fixnum))
  end

  def test_aq_sh_keys
    assert_equal(false, Settings.aq_sh.nil?)

    assert_equal(false, Settings.aq_sh.user_home.blank?)
    assert_equal(false, Settings.aq_sh.user_name.blank?)
    assert_equal(true, (["production", "development", "tests"].include? Settings.aq_sh.environment))
  end

  def test_repos_keys
    assert_equal(false, Settings.repos.nil?)

    assert_equal(false, Settings.repos.root_dir.blank?)
    assert_equal(false, Settings.repos.repo_user.blank?)
  end

  def test_git_keys
    assert_equal(false, Settings.git.nil?)

    assert_equal(false, Settings.git.repo_path.blank?)
    assert_equal(true, ([true, false].include? Settings.git.have_public_clone))
    assert_equal(false, Settings.git.shell.blank?)
    assert_equal(true, File.exist?(Settings.git.shell))
  end

  def test_shell_keys
    assert_equal(false, Settings.shell.nil?)

    assert_equal(false, Settings.shell.path.blank?)
    assert_equal(true, File.exist?(Settings.shell.path))
  end

  def test_logs_keys
    assert_equal(false, Settings.logs.nil?)

    assert_equal(false, Settings.logs.email.blank?)
    assert_equal(false, Settings.logs.scm.blank?)
    assert_equal(false, Settings.logs.aq_sh.blank?)
  end

  def test_admin_keys
    assert_equal(false, Settings.admin.nil?)
    assert_equal(false, Settings.pagination.nil?)

    assert_equal(false, Settings.admin.pagination.users.blank?)
    assert_equal(false, Settings.admin.pagination.ssh_keys.blank?)
    assert_equal(false, Settings.admin.pagination.repositories.blank?)
  end

  def test_mail_keys
    assert_equal(false, Settings.mail.nil?)
    assert_equal(true, (["sendmail", "smtp"].include? Settings.mail.delivery_method))

    if Settings.mail.delivery_method == "smtp"
      assert_equal(false, Settings.mail.smtp.nil?)
      assert_equal(false, Settings.mail.smtp.address.blank?)
      assert_equal(false, Settings.mail.smtp.default_url_host.blank?)
    end
  end
end
