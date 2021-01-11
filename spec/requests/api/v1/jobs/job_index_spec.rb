require 'rails_helper'

RSpec.describe "As a user" do
  describe "jobs index" do
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

    it "can see a list of jobs for a specific user" do
      create_list(:job, 3, user_id: @user1.id)

      get "/api/v1/users/#{@user1.id}/jobs"

      expect(response).to be_successful
      expect(Job.all.count).to eq(3)
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].count).to eq(3)
    end
  end
end
