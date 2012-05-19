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