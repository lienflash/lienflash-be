require 'sendgrid-ruby'
require 'twilio-ruby'
include SendGrid

class Api::V1::JobsController < ApplicationController

  def index
    render json: JobSerializer.new(Job.all) 
  end

  def show
    render json: JobSerializer.new(Job.find(params[:id]))
  end

  def create
    job = Job.new(job_params)

    if job.save
      render json: JobSerializer.new(job), status: 201

      WelcomeWorker.new.welcome_email(job)

# account_sid = ENV['TWILIO_SID']
# auth_token = ENV['TWILIO_AUTH_TOKEN']
# client = Twilio::REST::Client.new(account_sid, auth_token)

# from = '+14159413974' # Your Twilio number
# to = '+13037179808' # Your mobile phone number

# client.messages.create(
# from: from,
# to: to,
# body: "Hey friend!"
# )

    else
      render json: {"data":{"errors": job.errors.full_messages}}, status: 400
    end
  end
  
  def update
    job = Job.find(params[:id]) 
    job.status_update
    render json: JobSerializer.new(job), status: 200
  end 

  private

  def job_params
    params.permit(:job_street, :job_city, :job_state, :job_zip, :date_of_completion, :company_name, :contact_name, :material_cost, :labor_cost, :job_description, :job_id, :status)
  end
end
