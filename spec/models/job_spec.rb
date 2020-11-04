require 'rails_helper'
require 'date'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :job_type }
    it { should validate_presence_of :job_site_contact_name }
    it { should validate_presence_of :job_site_address }
    it { should validate_presence_of :job_site_city }
    it { should validate_presence_of :job_site_state }
    it { should validate_presence_of :job_site_zip_code }
    it { should validate_presence_of :description_of_work }
    it { should validate_presence_of :total_cost }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'instance methods' do
    it "default status: 'Good Standing' if none provided" do
      user1 = build(:user)
      job1 = build(:job, status: "", user_id: user1.id)
      expect(job1).to be_a(Job)
      expect(job1.status).to be_nil
      job1.save
      expect(job1.status).to eq("Good Standing")
    end
  end

  it "default_date: today if not provided" do
    fake_date_time = DateTime.now
    allow(DateTime).to receive(:now) {fake_date_time}
    user1 = build(:user)
    job1 = build(:job, completion_date: "", user_id: user1.id)
    expect(job1.completion_date).to be_nil
    job1.save
    expect(job1.completion_date).to be_truthy
    expect(job1.completion_date).to eq(DateTime.now)
  end

  it "days_outstanding" do
    user1 = create(:user)
    job = create(:job, completion_date: 1.days.ago, user_id: user1.id)
    expect(job.days_outstanding).to eq(1)
  end

  it "late?" do
    user1 = create(:user)
    job = create(:job, completion_date: 9.days.ago, user_id: user1.id)
    job2 = create(:job, completion_date: 1.days.ago, user_id: user1.id)
    job_labor = create(:job, job_type: "Labor", completion_date: 9.days.ago, user_id: user1.id)
    expect(job.days_outstanding).to eq(9)
    expect(job.late?).to be false
    expect(job2.late?).to be false
    expect(job_labor.late?).to be false
    travel(1.day)
    expect(job.late?).to be true
    expect(job2.late?).to be false
    expect(job_labor.late?).to be true
    travel(8.day)
    expect(job.late?).to be true
    expect(job2.late?).to be true
    expect(job_labor.late?).to be true
  end

  it "second notice?" do
    user1 = create(:user)
    job_tm = create(:job, completion_date: 74.days.ago, user_id: user1.id)
    job_labor = create(:job, job_type: "Labor", completion_date: 44.days.ago, user_id: user1.id)
    expect(job_tm.second_notice?).to be false
    expect(job_labor.second_notice?).to be false
    travel(1.day)
    expect(job_tm.second_notice?).to be true
    expect(job_labor.second_notice?).to be true
    travel(1.day)
    expect(job_tm.second_notice?).to be false
    expect(job_labor.second_notice?).to be false
  end

  it "third notice?" do
    user1 = create(:user)
    job_tm = create(:job, completion_date: 89.days.ago, user_id: user1.id)
    job_labor = create(:job, job_type: "Labor", completion_date: 89.days.ago, user_id: user1.id)
    expect(job_tm.third_notice?).to be false
    expect(job_labor.third_notice?).to be nil
    travel(1.day)
    expect(job_tm.third_notice?).to be true
    expect(job_labor.third_notice?).to be nil
    travel(1.day)
    expect(job_tm.third_notice?).to be false
    expect(job_labor.third_notice?).to be nil
  end

  it "fourth notice?" do
    user1 = create(:user)
    job_tm = create(:job, completion_date: 99.days.ago, user_id: user1.id)
    job_labor = create(:job, job_type: "Labor", completion_date: 99.days.ago, user_id: user1.id)
    expect(job_tm.fourth_notice?).to be false
    expect(job_labor.fourth_notice?).to be nil
    travel(1.day)
    expect(job_tm.fourth_notice?).to be true
    expect(job_labor.fourth_notice?).to be nil
    travel(1.day)
    expect(job_tm.fourth_notice?).to be false
    expect(job_labor.fourth_notice?).to be nil
  end

  it "final notice?" do
    user1 = create(:user)
    job_tm = create(:job, completion_date: 104.days.ago, user_id: user1.id)
    job_labor = create(:job, job_type: "Labor", completion_date: 46.days.ago, user_id: user1.id)
    expect(job_tm.final_notice?).to be false
    expect(job_labor.final_notice?).to be false
    travel(1.day)
    expect(job_tm.final_notice?).to be true
    expect(job_labor.final_notice?).to be true
    travel(1.day)
    expect(job_tm.final_notice?).to be false
    expect(job_labor.final_notice?).to be false
  end

  it "expired?" do
    user1 = create(:user)
    job_tm = create(:job, completion_date: 108.days.ago, user_id: user1.id)
    job_labor = create(:job, job_type: "Labor", completion_date: 48.days.ago, user_id: user1.id)
    expect(job_tm.expired?).to be false
    expect(job_labor.expired?).to be false
    JobFacade.new.update_jobs
    travel(1.day)
    JobFacade.new.update_jobs
    travel(1.day)
    JobFacade.new.update_jobs
    job_tm = Job.first
    job_labor = Job.last
    expect(job_tm.status).to eq("Inactive")
    expect(job_labor.status).to eq("Inactive")
    expect(job_tm.expired?).to be true
    expect(job_labor.expired?).to be true
    travel(1.day)
    expect(job_tm.expired?).to be true
    expect(job_labor.expired?).to be true
    travel(1.day)
    expect(job_tm.expired?).to be true
    expect(job_labor.expired?).to be true
  end

  it "status_update for job_type 'Materials & Labor'" do
    user1 = create(:user)
    job1 = create(:job, completion_date: 30.days.ago, user_id: user1.id)
    job2 = create(:job, completion_date: 30.days.ago, status: 3, user_id: user1.id)
    job1.status_update
    job2.status_update

    jo1 = Job.first
    job2 = Job.last

    expect(job1.status).to eq("Good Standing")
    expect(job2.status).to eq("NOI Filed")

    travel(1.day)
    job1.status_update
    job2.status_update
    job1 = Job.first
    job2 = Job.last
  end
end
