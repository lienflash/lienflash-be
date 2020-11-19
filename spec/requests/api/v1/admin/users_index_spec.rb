require 'rails_helper'

RSpec.describe "As an admin user" do
  describe "users index page" do
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
    it "can show a list of all users" do

      get '/api/v1/admin/users'
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].count).to eq(3)
      expect(json[:data].first[:attributes][:name]).to eq("Timmy")
      expect(json[:data][1][:attributes][:name]).to eq("Joshy")
    end

    it "can show a single user's info" do
      get "/api/v1/admin/users/#{@user3.id}"
      
      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data][:attributes][:name]).to eq("Nick")
    end

    it "can delete a single user" do
      expect(User.all.count).to eq(3)
      delete "/api/v1/admin/users/#{@user3.id}"
      
      expect(response.status).to eq(204)
      expect(User.all.count).to eq(2)
    end
  end
end