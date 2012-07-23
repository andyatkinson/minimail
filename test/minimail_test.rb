require 'rubygems'
require 'minitest/autorun'
require 'base64'

$:.unshift File.expand_path("../../lib", __FILE__)
require 'minimail'

class Minimail::MailTest < MiniTest::Unit::TestCase
  def test_that_a_minimail_can_be_initialized_with_typical_email_attributes
    subject = "Check this out!"
    recipients = "jane@example.com"
    body = "You want to see this"
    mail = Minimail::Mail.new(:subject => subject, :recipients => recipients, :body => body)
    assert_equal subject, mail.instance_variable_get(:@subject)
    assert_equal recipients, mail.instance_variable_get(:@recipients)
    assert_equal body, mail.instance_variable_get(:@body)
  end
  
  def test_can_prepare_a_minimail_with_a_single_attachment
    subject = "Check this out!"
    recipients = "jane@example.com"
    body = "You want to see this"
    attachment_filename = File.join(Dir.pwd, 'test', 'fake_attachment.txt')
    mail = Minimail::Mail.new(:subject => subject, :recipients => recipients, :body => body, :attachments => attachment_filename)
    assert_equal "/usr/bin/uuencode #{Dir.pwd}/test/fake_attachment.txt /tmp/fake_attachment.txt", mail.attachments
  end
  
  def test_can_prepare_a_minimail_with_multiple_attachments
    subject = "Check this out!"
    recipients = "jane@example.com"
    body = "You want to see this"
    files = [File.join(Dir.pwd, 'test', 'fake_attachment.txt'), File.join(Dir.pwd, 'test', 'fake_attachment.txt')]
    mail = Minimail::Mail.new(:subject => subject, :recipients => recipients, :body => body, :attachments => files)
    assert_equal "/usr/bin/uuencode #{Dir.pwd}/test/fake_attachment.txt /tmp/fake_attachment.txt;/usr/bin/uuencode #{Dir.pwd}/test/fake_attachment.txt /tmp/fake_attachment.txt", mail.attachments
  end
  
  def test_can_deliver_a_mail
    mail = Minimail::Mail.new(:recipients => "jane@example.com", :body => "check this out")
    assert_equal IO, mail.deliver.class
  end
  
  def test_ensure_mail_is_not_valid_unless_recipient_is_specified
    mail = Minimail::Mail.new()
    assert !mail.valid?
    assert_equal "Invalid mail contents", mail.deliver
  end
  
  def test_can_create_a_minimail_with_dsl_style
    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
      body "cool stuff"
    end
    assert_equal "check it!", m.instance_variable_get(:@subject)
    assert_equal "bob@example.com", m.instance_variable_get(:@recipients)
    assert_equal "cool stuff", m.instance_variable_get(:@body)
  end
  
  def test_mail_has_empty_string_body_if_none_provided
    recipients = "jane@example.com"
    mail = Minimail::Mail.new(:recipients => recipients)
    assert_equal '', mail.body
  end
end