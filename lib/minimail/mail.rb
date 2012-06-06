module Minimail
  class Mail
    attr_accessor :subject, :recipients, :body, :attachments
  
    def initialize(params = {})
      mail_program?

      @recipients = params[:recipients] || []
      @subject = params[:subject] || ""
      @body = params[:body] || ""
      @attachments = if encode_program? && params[:attachments]
        process_attachments( [params[:attachments]].flatten )
      end
    end
  
    def subject(subject = nil)
      @subject = subject
    end
  
    def recipients(recipients = nil)
      @recipients = recipients
    end
  
    def body(body = nil)
      @body = body
    end
  
    def deliver
      return unless valid?
      if @attachments
        IO.popen("(#{@attachments}) | #{mail_command} -s '#{@subject}' #{@recipients}", "w") do |io|
          io.write @body
          io.close_write
          io
        end
      else
        IO.popen("#{mail_command} -s '#{@subject}' #{@recipients}", "w") do |io|
          io.write @body
          io.close_write
          io
        end
      end
    end
  
    def mail_command
      return '/usr/bin/mail' if command?('/usr/bin/mail')
      return '/bin/mail' if command?('/bin/mail')
    end
  
    def valid?
      @recipients.empty? ? false : true
    end
  
    def draft(&block)
      instance_eval(&block)
    end
  
    private
      def process_attachments(files)
        return unless encode_program?
        return "Error reading /tmp dir" unless File.directory?('/tmp')
        files.map{|f| "/usr/bin/uuencode #{f} /tmp/#{File.basename(f)}"}.join(';')
      end
  
      def encode_program?
        command?('/usr/bin/uuencode')
      end
    
      def mail_program?
        command?('/usr/bin/mail') || command?('/bin/mail') ? true : "No mail program"
      end
    
      def command?(command)
        system("which #{command} > /dev/null 2>&1")
      end

  end
end