require 'date'

require '../app/services/twilio_service.rb'
require "../app/services/customer_text.rb"

RSpec.describe CustomerText do
  let(:to) { '+13037179808'}
  let(:msg_condition) { "A job in Lien Flash requires your attention." }

  let(:response) do
    'Success'
  end

  context 'job creation' do
    before do
      allow(TwilioService).to receive(:send_msg) { 'Success' }
    end

    it "sends SMS for job creation" do
      CustomerText.new.test_job_text_notification
      expect(TwilioService).to have_received(:send_msg).with(to, msg_condition)
    end
  end
end
