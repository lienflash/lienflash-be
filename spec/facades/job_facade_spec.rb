require 'rails_helper'
require 'date'


describe  "Rake Tasks" do
  describe 'Job Facade' do
    it 'can update the status of all jobs' do
      job1 = create:job
      job2 = create(:job, completion_date: 1.days.ago)
      JobFacade.update_jobs
      expect(job1.status).to eq("good standing")
      expect(job2.status).to eq("good standing")
      travel(1.day)
      JobFacade.update_jobs
      expect(job1.status).to eq("NOI Eligible")
      expect(job2.status).to eq("good standing")
    end
  end
end
