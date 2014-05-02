Minimail sends emails (using `mail` with attachments using `uuencode`).

## Usage

As a one-liner:

    Minimail::Mail.new(:subject => "[app] Background job is complete", :recipients => "engineer@example.com").deliver

DSL style:

    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
    end
    m.deliver

With an attachment:

    Minimail::Mail.new(:subject => "[app] Success", :recipients => "engineer@example.com", :attachments => File.join(Dir.pwd, 'test', 'fake_attachment.txt')).deliver

## Tests

    rake

## Common issues

Some ISPs will block the SMTP port or black-list IP addresses. I was not able to send on a Verizon connection at home, but was able to send using cellular connections (AT&T and Verizon) while tethered.

With gmail, the test mails show up in the spam folder. On OS X, mail sends are logged here:

    tail -f /var/log/mail.log

## Credits

Minimail was inspired by some code from Val Aleksenko. Thanks Val!
