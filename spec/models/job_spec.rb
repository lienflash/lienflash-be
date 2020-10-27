require 'rails_helper'
require 'date'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :job_street }
    it { should validate_presence_of :job_city }
    it { should validate_presence_of :job_state }
    it { should validate_presence_of :job_zip }
    it { should validate_presence_of :date_of_completion }
    # it { should validate_presence_of :company_name }
    # it { should validate_presence_of :contact_name }
    # it { should validate_presence_of :material_cost }
    # it { should validate_presence_of :labor_cost }
    # it { should validate_presence_of :job_description }
    # it { should validate_presence_of :job_id }
  end

  # when user table is created
  # describe 'relationships' do
  #   it { should belong_to :user }
  # end
  it "can be created with a default status of 'good_standing'" do
    job1 = Job.create(
        job_street: "123 Main St.",
        job_city: "Denver",
        job_state: "Co",
        job_zip: "80218",
        date_of_completion: "2020-01-01T04:05:06+00:00",
        company_name: "Construction Co Inc LLC",
        contact_name: "Timmy Tim Tim",
        material_cost: 1000.00,
        labor_cost: 100.00,
        job_description: "We fixed some stuff.",
        job_id: "ABC123"
      )
      expect(job1).to be_a(Job)
      expect(job1.status).to eq("good standing")
  end
  it "will have a default value for date_of_completion equal to created_at" do
    job1 = Job.create(
        job_street: "123 Main St.",
        job_city: "Denver",
        job_state: "Co",
        job_zip: "80218",
        date_of_completion: "",
        company_name: "Construction Co Inc LLC",
        contact_name: "Timmy Tim Tim",
        material_cost: 1000.00,
        labor_cost: 100.00,
        job_description: "We fixed some stuff.",
        job_id: "ABC123"
    )
  end 
  it "will have status updated to 'late' when 30 days past date of substancial completion" do
    job1 = Job.create(
        job_street: "123 Main St.",
        job_city: "Denver",
        job_state: "Co",
        job_zip: "80218",
        date_of_completion: "2020-08-30T04:05:06+00:00",
        company_name: "Construction Co Inc LLC",
        contact_name: "Timmy Tim Tim",
        material_cost: 1000.00,
        labor_cost: 100.00,
        job_description: "We fixed some stuff.",
        job_id: "ABC123"
    )
    job2 = Job.create(
        job_street: "777 Pleasantville Rd.",
        job_city: "Boulder",
        job_state: "Co",
        job_zip: "80304",
        date_of_completion: "2020-09-27T04:05:06+00:00",
        company_name: "Construction Co Inc LLC",
        contact_name: "Josh T",
        material_cost: 1000.00,
        labor_cost: 100.00,
        job_description: "Fixed a leaky roof.",
        job_id: "ABC124"
    )
    
    #expect(job1.status).to eq("late")
    #expect(job2.status).to eq("good standing")

  end 
end
