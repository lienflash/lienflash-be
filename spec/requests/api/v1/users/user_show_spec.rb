require 'rails_helper'

describe "API V1 Users", type: 'request' do
  before(:each) do
    @user1 = User.create(
            name: "Timmy",
            business_name: "Timmy's plumbing",
            email: "email1234@gmail.com",
            business_work_number: "555-123-4567",
            business_cell_number: "555-123-4567",
            business_address: "123 Main St.",
            business_city: "Denver",
            business_state: "CO",
            business_zip_code: "80218",
            password: "password1",
            password_confirmation: "password1"
          )
  end


  it "can auto log in a user" do
    allow_any_instance_of(ApplicationController).to receive(:logged_in_user).and_return(@user1)

    get "/api/v1/users/verified", headers: { authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.0PxlxpedZDAnDTPYmb21m8gwBivJygqq1REBnHhzPBA' }

    data = JSON.parse(response.body, symbolize_names: true)
    
    expect(data[:data][:attributes][:name]).to eq("#{@user1.name}")
    expect(data[:data][:attributes][:business_name]).to eq("#{@user1.business_name}")
    expect(data[:data][:attributes][:email]).to eq("#{@user1.email}")
  end

  it "creates can return a single users information" do
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)

    get "/api/v1/users/#{@user1.id}"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data][:attributes][:name]).to eq("#{@user1.name}")
    expect(data[:data][:attributes][:business_name]).to eq("#{@user1.business_name}")
    expect(data[:data][:attributes][:email]).to eq("#{@user1.email}")
  end
end
