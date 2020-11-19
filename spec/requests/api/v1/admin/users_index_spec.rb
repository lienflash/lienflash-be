require 'rails_helper'

RSpec.describe "As an admin user" do
  describe "users index page" do
    before(:each) do
      user1 =  User.create(
          name: "Timmy",
          business_name: "Timmy's plumbing",
          email: "josh.tukman@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "+17203192655",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1"
        )
      user2 =  User.create(
          name: "Joshy",
          business_name: "Timmy's plumbing",
          email: "josh.tukman@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "+17203192655",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1"
        )
    end
    it "can show a list of all users" do
      allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
      get '/api/v1/admin/users'
      #expect(response).to be_successful
    end
  end
end