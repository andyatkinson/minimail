## Minimail

Minimail sends emails from ruby apps using `mail`. Attachments can be added as well using `uuencode`.

Here is some [information on sending mail from shell scripts](http://www.cyberciti.biz/faq/linux-unix-bash-ksh-csh-sendingfiles-mail-attachments/).

### Dependencies

Run `./dependencies` to make sure you have `mail` and `uuencode`.

### Usage

Bundle the gem into your project. Or if you want to test it out in irb:

    bundle exec irb
    Bundler.require
    Minimail::Mail.new(subject: '[notification] Background job finished', recipients: 'team@example.com').deliver

DSL style:

    m = Minimail::Mail.new
    m.draft do
      subject "check it!"
      recipients "bob@example.com"
    end
    m.deliver

With an attachment:

    Minimail::Mail.new(subject: 'Finished', recipients: 'team@example.com', attachments: File.join(Dir.pwd, 'test', 'fake_attachment.txt')).deliver

### Tests

    rake

## Common issues

Some ISPs will block the SMTP port or black-list IP addresses. I was not able to send on a Verizon connection at home, but was able to send using cellular connections (AT&T and Verizon) while tethered.

With gmail, the test mails show up in the spam folder. On OS X, mail sends are logged here:

    tail -f /var/log/mail.log

### Credits

Minimail was inspired by some code from Val Aleksenko. Thanks Val!

### License

The MIT License (MIT)

Copyright (c) 2014 Andy Atkinson

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
