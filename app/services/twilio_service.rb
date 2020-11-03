
class TwilioService
  FROM = ENV['SENDER_NUMBER']
  SID = ENV['TEST_TWILIO_SID']
  AUTH = ENV['TEST_TWILIO_AUTH_TOKEN']

  def self.send_msg(receipient, sms_body)
    client.messages.create(
      from: FROM,
      to: to,
      body: "A job in Lien Flash requires your attention."
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(SID, AUTH)
  end
end
