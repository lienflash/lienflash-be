# require 'rails_helper'
#
# RSpec.describe 'text feature spec' do
#   before :each do
#     @user = create(:user)
#     @job = create(:job, user_id: @user.id)
#   end
#
#   it "will send a text on the from CustomerText job creation" do
#     counter = FakeSMS.messages.count
#     expect(FakeSMS.messages).to eq([])
#     CustomerText.new.job_creation(@job)
#     counter += 1
#     expect(FakeSMS.messages.count).to eq(counter)
#   end
#
#   it "will send a text on the from CustomerText job_notification" do
#     counter = FakeSMS.messages.count
#     expect(FakeSMS.messages.count).to eq(counter)
#     CustomerText.new.job_text_notification(@job)
#     counter += 1
#     expect(FakeSMS.messages.count).to eq(counter)
#   end
#
#   it "will send a text on the from CustomerText final_notification" do
#     counter = FakeSMS.messages.count
#     expect(FakeSMS.messages.count).to eq(counter)
#     CustomerText.new.job_text_notification(@job)
#     counter += 1
#     expect(FakeSMS.messages.count).to eq(counter)
#   end
# end
