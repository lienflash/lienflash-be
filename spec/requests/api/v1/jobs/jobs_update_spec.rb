require 'rails_helper'

# Rails.describe "API V1 Jovs", type: 'request' do
#   describe "Patch /api/v1/jobs/:id" do   
#     before(:each) do 
#       @job1 = Job.create(
#         job_street: "123 Main St.",
#         job_city: "Denver",
#         job_state: "Co",
#         job_zip: "80218",
#         date_of_completion: "2020-01-01T04:05:06+00:00",
#         company_name: "Construction Co Inc LLC",
#         contact_name: "Timmy Tim Tim",
#         material_cost: 1000.00,
#         labor_cost: 100.00,
#         job_description: "We fixed some stuff.",
#         job_id: "ABC123"
#       )
#       @job2 = Job.create(
#         job_street: "1 Different Rd.",
#         job_city: "Denver",
#         job_state: "Co",
#         job_zip: "80218",
#         date_of_completion: "2020-01-01T04:05:06+00:00",
#         company_name: "Construction Co Inc LLC",
#         contact_name: "Timmy Tim Tim",
#         material_cost: 1000.00,
#         labor_cost: 100.00,
#         job_description: "We fixed some stuff.",
#         job_id: "ABC123" 
#       )
#     end
#     it "can update the status of a job" do
#       patch "/api/v1/jobs/#{@job1.id}" 
      
#       expect(response).to be_successful
#       expect(response.status).to eq(200)

#       json = JSON.parse(response.body, symbolize_names: true)
  
#       expect(json[:data][:attributes][:status]).to eq("NOI Eligible")
#     end
#   end
# end