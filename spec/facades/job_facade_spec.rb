require 'rails_helper'
require 'date'


RSpec.describe  "Rake Tasks" do
  describe 'Job Facade' do
    it 'can update the status of all jobs' do
      job1 = create(:job, completion_date: 44.days.ago)
      job2 = create(:job, completion_date: 1.days.ago)
      job3 = create(:job, status: "NOI filed", completion_date: 44.days.ago)
      jobs = [job1, job2, job3]
      
      expect(job1.status).to eq("good standing")
      expect(job2.status).to eq("good standing")
      expect(job3.status).to eq("NOI filed")
      travel(1.days)

      JobFacade.new.update_jobs

      job1 = Job.first

      expect(job1.status).to eq("NOI Eligible")
      expect(job2.status).to eq("good standing")
      expect(job3.status).to eq("NOI filed")
    end
  end
end
