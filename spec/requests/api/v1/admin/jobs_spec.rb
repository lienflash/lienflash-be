require 'rails_helper'

RSpec.describe "As an admin user" do
  describe "jobs crud functionality" do
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
      @user2 =  User.create(
          name: "Joshy",
          business_name: "Timmy's plumbing",
          email: "josh.t@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "+17203192655",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1"
        )
      @user3 =  User.create(
          name: "Nick",
          business_name: "Timmy's plumbing",
          email: "jt@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "+17203192655",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1"
        )
      allow_any_instance_of(ApplicationController).to receive(:admin?).and_return(true)
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    end

    it "can see a list of jobs for a specific user" do
      create_list(:job, 3, user_id: @user3.id)
      create(:job, user_id: @user2.id)

      get "/api/v1/admin/users/#{@user3.id}/jobs"

      expect(response).to be_successful
      expect(Job.all.count).to eq(4)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].count).to eq(3)
    end

    it "admin user can see specific job for a user" do
      create_list(:job, 3, user_id: @user3.id)
      job = Job.first
      get "/api/v1/admin/users/#{@user3.id}/jobs/#{job.id}"
      
      expect(Job.all.count).to eq(3)
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json[:data][:id]).to eq(job.id.to_s)
    end
    
    it "admin user can update status of job" do
      create_list(:job, 3, user_id: @user3.id)
      create(:job, user_id: @user3.id, status: 2)
      job = Job.last
      expect(job.status).to eq("NOI Requested")
      patch "/api/v1/admin/users/#{@user3.id}/jobs/#{job.id}"
      job = Job.last
      expect(job.status).to eq("NOI Filed")
      patch "/api/v1/admin/users/#{@user3.id}/jobs/#{job.id}"
      job = Job.last
      
      expect(job.status).to eq("Lien Filed") 
    end
  end
end