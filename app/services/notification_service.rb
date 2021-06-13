require 'slack-notify'

module NotificationService
  def self.new_inquiry(inquiry)
    # TODO: Configure mailer on production server
    # InquiryMailer.created_email(inquiry).deliver
    client = SlackNotify::Client.new(
      webhook_url: Rails.application.credentials.dig(:slack, :webhook_url)
    )
    client.notify(
      "New Inquiry From #{inquiry.company} In Your Inbox", 
      '#flex-coast-notify'
    )
  end
end
