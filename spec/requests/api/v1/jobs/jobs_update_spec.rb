require 'rails_helper'

RSpec.describe "As a  user" do
  describe "job show" do
    before(:each) do
      @user1 =  User.create(
          name: "Timmy",
          business_name: "Joshy's plumbing",
          email: "josh.tukman@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "+17203192655",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1",
          role: 1
        )
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    end

    it "can inactive a job" do
      create_list(:job, 3, user_id: @user1.id)
      @job = Job.last
      expect(@job.status).to eq("Good Standing")

      patch "/api/v1/users/#{@user1.id}/jobs/#{@job.id}?status=5"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:status]).to eq("Inactive")
    end

    it "can change status to NOI Requested" do
      create_list(:job, 3, user_id: @user1.id)
      @job = Job.last
      expect(@job.status).to eq("Good Standing")

      patch "/api/v1/users/#{@user1.id}/jobs/#{@job.id}?status=2"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:status]).to eq("NOI Requested")
    end

    it "can check status update against method" do
      create_list(:job, 3, user_id: @user1.id)
      @job = Job.last
      expect(@job.status).to eq("Good Standing")

      patch "/api/v1/users/#{@user1.id}/jobs/#{@job.id}?status=1"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:status]).to eq("Good Standing")
    end
  end
end
