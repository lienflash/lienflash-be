class TwilioService
  FROM = ENV['SENDER_NUMBER']
  SID = ENV['TWILIO_SID']
  AUTH = ENV['TWILIO_AUTH_TOKEN']

  cattr_accessor :client
  
  def self.send_msg(recipient, sms_body)
    client.messages.create(
      from: FROM,
      to: recipient,
      body: sms_body
    )
  end

  # private

  def client
    @client ||= Twilio::REST::Client.new(SID, AUTH)
  end
end
