require 'rails_helper'

Rails.describe "Jobs Facade" do
  before(:each) do
    @user1 = create(:user)
  end
  
  it "can update jobs to NOI eligible when late" do

    job1 = Job.create(
      job_type: "Labor",
          job_site_contact_name: "Tim",
          job_site_name: "Job Site",
          job_site_address: "123 Main St.",
          job_site_city: "Denver",
          job_site_state: "CO",
          job_site_zip_code: "80218",
          completion_date: "2020-10-20T04:05:06+00:00",
          description_of_work: "We fixed a toilet",
          labor_cost: 100.00,
          material_cost: 150.00,
          total_cost: 250.00,
          user_id: @user1.id
    )
    job2 = Job.create(
      job_type: "Labor",
          job_site_contact_name: "Tim",
          job_site_name: "Job Site",
          job_site_address: "123 Main St.",
          job_site_city: "Denver",
          job_site_state: "CO",
          job_site_zip_code: "80218",
          completion_date: "2020-09-20T04:05:06+00:00",
          description_of_work: "We fixed a toilet",
          labor_cost: 100.00,
          material_cost: 150.00,
          total_cost: 250.00,
          user_id: @user1.id
    )
    expect(job2.status).to eq("Good Standing")
    JobFacade.new.update_jobs
    job2 = Job.last
    expect(job2.status).to eq("NOI Eligible")
  end
end
