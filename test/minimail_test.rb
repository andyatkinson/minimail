require 'rubygems'
require 'minitest/autorun'

$:.unshift File.expand_path("../../lib", __FILE__)
require 'minimail'

class MinimailTest < MiniTest::Unit::TestCase
  def test_that_a_minimail_can_be_initialized_with_attributes
    subject = "Check this out!"
    recipients = "jane@gmail.com"
    body = "Very cool"
    mail = Mail.new(:subject => subject, :recipients => recipients, :body => body)
    assert_equal subject, mail.subject
    assert_equal recipients, mail.recipients
    assert_equal body, mail.body
  end
end