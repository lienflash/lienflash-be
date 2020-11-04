module FakeSMS
  FROM = ENV['SENDER_NUMBER']

  @@messages = []

  def self.messages
    @@messages
  end

  def self.send_msg(recipient, sms_body)
    from = ENV['SENDER_NUMBER']
    to = "+12345672345"
    body = "lets see if this works"
    message = OpenStruct.new(from: from, to: to, body: body)
    @@messages << message
  end
end
