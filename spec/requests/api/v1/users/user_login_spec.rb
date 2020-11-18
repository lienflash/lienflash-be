require 'rails_helper'

describe "API V1 Users", type: 'request' do
  describe "POST /api/v1/login" do
    before(:each) do
      User.create(
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

    context "with valid parameters" do
      let(:valid_params) do
        {
          email: "email1234@gmail.com",
          password: "password1"
        }
      end

      it "logs in an existing user" do
        post "/api/v1/login", params: valid_params
        expect(response).to be_successful
        expect(response.status).to eq(200)

        data = JSON.parse(response.body)
        expect(data["data"]["attributes"]["email"]).to eq("email1234@gmail.com")
        expect(data["data"]["attributes"]["business_name"]).to eq("Timmy's plumbing")

        @user = User.last
      end

      context "with invalid email" do
        let(:invalid_email_params) do
          {
            email: "",
            password: "password1",
          }
        end

        it "can not log in an existing user with bad params" do
          post "/api/v1/login", params: invalid_email_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(401)
          expect(data["data"]["errors"]).to eq("Invalid credentials")
        end
      end

      context "with an invalid password" do
        let(:invalid_password_params) do
          {
            email: "email1234@gmail.com",
            password: "",
          }
        end

        it "can not log in an existing user with invalid password" do
          post "/api/v1/login", params: invalid_password_params
          data = JSON.parse(response.body)

          expect(response.status).to eq(401)
          expect(data["data"]["errors"]).to eq("Invalid credentials")
        end
      end
    end
  end
end
