require 'rails_helper'

describe "API V1 Jobs", type: 'request' do
  describe "POST /api/v1/user/jobs" do
    before(:each) do
      @user1 = create(:user)
    end

    context "with valid parameters" do
      let(:valid_params) do
        {
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
        }
      end

      it "creates a new job" do
        post "/api/v1/user/#{@user1.id}/jobs", params: valid_params
        expect(response).to be_successful
        expect(response.status).to eq(201)
      end

#       # it "creates a new job given the correct attributes" do
#       #   post "/api/v1/jobs", params: valid_params

#       #   @job = Job.last
#       #   expect(@job.job_id).to eq("ABC123")
#       # end


#       context "with invalid parameters" do
#         let(:invalid_params) do
#           {
#             job_city: "Denver",
#             job_state: "Co",
#             job_zip: "80218",
#             date_of_completion: "2020-01-01T04:05:06+00:00",
#             company_name: "Construction Co Inc LLC",
#             contact_name: "Timmy Tim Tim",
#             material_cost: 1000.00,
#             labor_cost: 100.00,
#             job_description: "We fixed some stuff.",
#             job_id: "ABC123",
#           }
#         end

#         it "does not create a new job" do
#           post "/api/v1/jobs", params: invalid_params
#           data = JSON.parse(response.body)

#           expect(response.status).to eq(400)
#           expect(data["data"]["errors"][0]).to eq("Job street can't be blank")
#         end
      # end
    end
  end
end
