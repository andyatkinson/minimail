class Mail
  attr_accessor :subject, :recipients, :body, :attachments
  
  def initialize(params = {})
    mail_program?
    
    @recipients = params[:recipients] || []
    @subject = params[:subject] || ""
    @body = params[:body] || ""
    @attachments = encode_attachments? && params[:attachments] ? process_attachments(params[:attachments]) : nil
    
    if @attachments
      IO.popen("echo #{@body} | (#{@attachments}) | #{mail_command} -s '#{@subject}' #{@recipients}")
    else
      IO.popen("echo #{@body} | #{mail_command} -s '#{@subject}' #{@recipients}")
    end
    
  end
  
  def mail_command
    return '/usr/bin/mail' if command?('/usr/bin/mail')
    return '/bin/mail' if command?('/bin/mail')
  end
  
  def process_attachments(filenames = "")
    return unless encode_attachments?
    return unless File.directory?('/tmp')
    filenames.split(',').map{|f| "/usr/bin/uuencode #{f} /tmp/#{f}"}.join(';')
  end
  
  private
  
    def encode_attachments?
      command?('/usr/bin/uuencode') ? true : "No encode program"
    end
    
    def mail_program?
      command?('/usr/bin/mail') || command?('/bin/mail') ? true : "No mail program"
    end
    
    def command?(command)
      system("which #{command} > /dev/null 2>&1")
    end

end