require 'rails_helper'
require 'date'


RSpec.describe  "Rake Tasks" do
  describe 'Job Facade' do
    it 'can update the status of all jobs' do
      user1 = create(:user, email: "josh.tukman@gmail.com", business_cell_number: "+17203192655")
      job1 = create(:job, completion_date: 44.days.ago, user_id: user1.id)
      job2 = create(:job, completion_date: 1.days.ago, user_id: user1.id)
      job3 = create(:job, status: "NOI Filed", completion_date: 44.days.ago, user_id: user1.id)
      jobs = [job1, job2, job3]

      expect(job1.status).to eq("Good Standing")
      expect(job2.status).to eq("Good Standing")
      expect(job3.status).to eq("NOI Filed")
      travel(1.days)

      JobFacade.new.update_jobs

      job1 = Job.first
      job3 = Job.last
      job2 = Job.find(job2.id)
      
      expect(job1.status).to eq("NOI Eligible")
      expect(job2.status).to eq("Good Standing")
      expect(job3.status).to eq("NOI Filed")
    end
  end
end
