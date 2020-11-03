require 'rails_helper'
require 'date'

RSpec.describe CustomerText do
  context 'instance methods' do
    before :each do
      allow(TwilioService).to receive(:send_msg) { 'Success' }
      @user = create(:user)
      @job = create(:job, user_id: @user.id)
      @to = @job.user.business_cell_number
    end

    it "job creation" do
      # to = @job.user.business_cell_number
      msg = "A new job has been created using Lien Flash."
      CustomerText.new.job_creation(@job)
      expect(TwilioService).to have_received(:send_msg).with(@to, msg)
    end

    it "job_text_notification" do
      msg = "A job in Lien Flash requires your attention."
      CustomerText.new.job_text_notification(@job)
      expect(TwilioService).to have_received(:send_msg).with(@to, msg)
    end

    it "final_text_notification" do
      msg = "A job in Lien Flash desperately requires your attention."
      CustomerText.new.final_text_notification(@job)
      expect(TwilioService).to have_received(:send_msg).with(@to, msg)
    end
  end
end
