Minimail sends emails. I use it to send notification emails to myself from scripts. `/usr/bin/mail -s 'hi there' bob@example.com` can be called from a shell script as well, Minimail just wraps that. Minimail wraps command-line code with descriptive method and variable names and test code, to make maintenance easier. Minimail makes it easier to share this functionality between projects thanks to Rubygems and bundler.

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

    # Send an email (one-liner)
    Minimail::Mail.new(:subject => "check it!", :recipients => "bob@example.com").deliver
    
    # Or do the same with a DSL style
    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
    end
    m.deliver
    
    # Include an attachment
    Minimail::Mail.new(:subject => "check this attachment", :recipients => "bob@example.com", :attachments => File.join(Dir.pwd, 'test', 'fake_attachment.txt')).deliver


Debugging
=========
Some ISPs will block the SMTP port or black-list IP addresses. I was not able to send on a Verizon ISP connection for home,
but was able to send using my cellular 3G connection (also Verizon) while tethered.

The mail will also likely show up in the spam folder.

  # on OS X tail the mail log file
  tail -f /var/log/mail.log

Credits
=======
Minimail was inspired by some code from Val Aleksenko. Thanks Val!