require 'rails_helper'

describe "API V1 Users", type: 'request' do
  describe "POST /api/v1/users" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          name: "Timmy",
          business_name: "Timmy's plumbing",
          email: "email12345@gmail.com",
          business_work_number: "555-123-4567",
          business_cell_number: "555-123-4567",
          business_address: "123 Main St.",
          business_city: "Denver",
          business_state: "CO",
          business_zip_code: "80218",
          password: "password1",
          password_confirmation: "password1"
        }
      end

      it "creates a new user" do
        post "/api/v1/users", params: valid_params
        expect(response).to be_successful
        expect(response.status).to eq(201)
      end


      it "creates a user with the correct attributes" do
        post "/api/v1/users", params: valid_params

        @user = User.last
        expect(@user.email).to eq("email12345@gmail.com")
        expect(@user.business_name).to eq("Timmy's plumbing")

        data = JSON.parse(response.body)
        expect(data["data"]["attributes"]["business_name"]).to eq("Timmy's plumbing")
      end

      context "with invalid parameters" do
        let(:invalid_email_params) do
          {
            name: "Timmy",
            business_name: "Timmy's plumbing",
            email: "email123",
            business_work_number: "555-123-4567",
            business_cell_number: "555-123-4567",
            business_address: "123 Main St.",
            business_city: "Denver",
            business_state: "CO",
            business_zip_code: "80218",
            password: "password1",
            password_confirmation: "password1"
          }
        end

        it "does not create a new user" do
          post "/api/v1/users", params: invalid_email_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"][0]).to eq("Email is invalid")
        end

        let(:invalid_password_params) do
          {
            name: "Timmy",
            business_name: "Timmy's plumbing",
            email: "email123456@gmail.com",
            business_work_number: "555-123-4567",
            business_cell_number: "555-123-4567",
            business_address: "123 Main St.",
            business_city: "Denver",
            business_state: "CO",
            business_zip_code: "80218",
            password: "",
          }
        end

        it "creates a new user" do
          post "/api/v1/users", params: invalid_password_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(data["data"]["errors"][0]).to eq("Password can't be blank")
        end
      end
    end
  end
end
