    require 'minimail'
    
    # Send an email
    Minimail::Mail.new(:subject => "check it!", :recipients => "bob@example.com").deliver
    
    # DSL style
    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
    end
    m.deliver
    
    # check tests for examples that encode attachments