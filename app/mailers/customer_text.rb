require 'twilio-ruby'

class CustomerText
  def job_creation
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14159413974' # Your Twilio number
    to = '+17203192655' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "A new job has been created using Lien Flash."
    )
  end
end
