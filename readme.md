Installation
=========

With bundler
------------
    
    # gem install bundler
    gem 'minimail'
    bundle
    
Without bundler
---------------

    require 'minimail'

Usage
=====

    # Send an email one-liner
    Minimail::Mail.new(:subject => "check it!", :recipients => "bob@example.com").deliver
    
    # Send an email using a DSL style
    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
    end
    m.deliver


Debugging
=========
Some ISPs will block the SMTP port or black-list IP addresses. I was not able to send on a Verizon ISP connection for home,
but was able to send using my cellular 3G connection (also Verizon) while tethered.

The mail will also likely show up in the spam folder.

  # on OS X tail the mail log file
  tail -f /var/log/mail.log
  