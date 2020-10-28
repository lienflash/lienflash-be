require 'rails_helper'
require 'date'

RSpec.describe Job, type: :model do
  describe 'validations' do
    it { should validate_presence_of :job_type }
    it { should validate_presence_of :job_site_contact_name }
    it { should validate_presence_of :job_site_name }
    it { should validate_presence_of :job_site_address }
    it { should validate_presence_of :job_site_city }
    it { should validate_presence_of :job_site_state }
    it { should validate_presence_of :job_site_zip_code }
    it { should validate_presence_of :completion_date }
    it { should validate_presence_of :description_of_work }
    it { should validate_presence_of :labor_cost }
    it { should validate_presence_of :material_cost }
    it { should validate_presence_of :total_cost }
  end

  # when user table is created
  # describe 'relationships' do
  #   it { should belong_to :user }
  # end
  it "can be created with a default status of 'good_standing'" do
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
            total_cost: 250.00
          )
      expect(job1).to be_a(Job)
      expect(job1.status).to eq("good standing")
  end
  # it "will have a default value for date_of_completion equal to created_at" do
  #   job1 = Job.create(
  #       job_street: "123 Main St.",
  #       job_city: "Denver",
  #       job_state: "Co",
  #       job_zip: "80218",
  #       date_of_completion: "",
  #       company_name: "Construction Co Inc LLC",
  #       contact_name: "Timmy Tim Tim",
  #       material_cost: 1000.00,
  #       labor_cost: 100.00,
  #       job_description: "We fixed some stuff.",
  #       job_id: "ABC123"
  #   )
  # end
  it "will have status updated to 'late' when 30 days past date of substancial completion" do
    # job1 = Job.create(
    #         job_type: "Labor",
    #         job_site_contact_name: "Tim",
    #         job_site_name: "Job Site",
    #         job_site_address: "123 Main St.",
    #         job_site_city: "Denver",
    #         job_site_state: "CO",
    #         job_site_zip_code: "80218",
    #         completion_date: "2020-10-20T04:05:06+00:00",
    #         description_of_work: "We fixed a toilet",
    #         labor_cost: 100.00,
    #         material_cost: 150.00,
    #         total_cost: 250.00
    #       )
    #       job2 = Job.create(
    #               job_type: "Labor",
    #               job_site_contact_name: "Tim",
    #               job_site_name: "Job Site",
    #               job_site_address: "123 Main St.",
    #               job_site_city: "Denver",
    #               job_site_state: "CO",
    #               job_site_zip_code: "80218",
    #               completion_date: "2020-10-20T04:05:06+00:00",
    #               description_of_work: "We fixed a toilet",
    #               labor_cost: 100.00,
    #               material_cost: 150.00,
    #               total_cost: 250.00
    #             )

    #expect(job1.status).to eq("late")
    #expect(job2.status).to eq("good standing")

  end
end
