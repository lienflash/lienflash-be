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
    body: "A new job has been created using Lien Flash.")
  end

  def job_text_notification
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14159413974' # Your Twilio number
    to = '+17203192655' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "A job in Lien Flash requires your attention.")
  end

  def final_text_notification
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14159413974' # Your Twilio number
    to = '+17203192655' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "A job in Lien Flash desperately requires your attention.")
  end
  
  def test_job_creation
    account_sid = ENV['TEST_TWILIO_SID']
    auth_token = ENV['TEST_TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14159413974' # Your Twilio number
    to = '+17203192655' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "A new job has been created using Lien Flash.")
  end

  def test_job_text_notification
    account_sid = ENV['TEST_TWILIO_SID']
    auth_token = ENV['TEST_TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14159413974' # Your Twilio number
    to = '+17203192655' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "A job in Lien Flash requires your attention.")
  end

  def test_final_text_notification
    account_sid = ENV['TEST_TWILIO_SID']
    auth_token = ENV['TEST_TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+14159413974' # Your Twilio number
    to = '+17203192655' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "A job in Lien Flash desperately requires your attention.")
  end
end
