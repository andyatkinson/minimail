Minimail sends emails (using `mail` with attachments using `uuencode`).

Installation
=========

With bundler
------------

    gem 'minimail'
    bundle
    
Without bundler
---------------

    require 'minimail'

Usage
=====

    # Send an email in one line
    Minimail::Mail.new(:subject => "[app] Background job is complete", :recipients => "engineer@example.com").deliver
    
    # Or use a DSL style
    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
    end
    m.deliver
    
    # Add an attachment
    Minimail::Mail.new(:subject => "[app] Success", :recipients => "engineer@example.com", :attachments => File.join(Dir.pwd, 'test', 'fake_attachment.txt')).deliver

Run tests
=========
  
    # With RVM, `rvm use 1.8.7 && rvm gemset create minimail && rvm gemset use minimail`
    rake

Debugging
=========
Some ISPs will block the SMTP port or black-list IP addresses. I was not able to send on a Verizon connection at home, but was able to send using cellular connections (AT&T and Verizon) while tethered.

With gmail, the test mails show up in the spam folder. To check your mail log file on OS X:

    tail -f /var/log/mail.log

Credits
=======
Minimail was inspired by some code from Val Aleksenko. Thanks Val!