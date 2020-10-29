require 'rails_helper'
require 'date'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :job_type }
    it { should validate_presence_of :job_site_contact_name }
    # it { should validate_presence_of :job_site_name }
    it { should validate_presence_of :job_site_address }
    it { should validate_presence_of :job_site_city }
    it { should validate_presence_of :job_site_state }
    it { should validate_presence_of :job_site_zip_code }
    # it { should validate_presence_of :completion_date }
    it { should validate_presence_of :description_of_work }
    #it { should validate_presence_of :labor_cost }
    #it { should validate_presence_of :material_cost }
    it { should validate_presence_of :total_cost }
  end

  # future belong_to relationship with user

  describe 'instance methods' do
    it "default status: 'good standing' if none provided" do
      job1 = build(:job, status: "")
      expect(job1).to be_a(Job)
      expect(job1.status).to be_nil
      job1.save
      expect(job1.status).to eq("good standing")
    end

    it "default_date: today if not provided" do
      fake_date_time = DateTime.now
      allow(DateTime).to receive(:now) {fake_date_time}
      job1 = build(:job, completion_date: "")
      expect(job1.completion_date).to be_nil
      job1.save
      expect(job1.completion_date).to be_truthy
      expect(job1.completion_date).to eq(DateTime.now)
    end

    it "days_outstanding" do
      job = create(:job, completion_date: 1.days.ago)
      expect(job.days_outstanding).to eq(1)
    end

    it "late?" do
      job = create(:job)
      job2 = create(:job, completion_date: 1.days.ago)
      expect(job.days_outstanding).to eq(45)
      expect(job.late?).to be true
      expect(job2.late?).to be false
    end

    it "status_update" do
      job1 = create(:job, completion_date: 44.days.ago)
      job2 = create(:job, completion_date: 44.days.ago, status: 2)
      job1.status_update
      job2.status_update
      expect(job1.status).to eq("good standing")
      expect(job2.status).to eq("NOI filed")
      travel(1.day)
      job1.status_update
      job2.status_update
      job1 = Job.first
      expect(job1.status).to eq("NOI Eligible")
      expect(job2.status).to eq("NOI filed")
    end
  end
end
