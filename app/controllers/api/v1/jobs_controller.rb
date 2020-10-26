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

#       from = Email.new(email: 'josh.tukman@gmail.com')
#       to = Email.new(email: 'leland.white@gmail.com')
#       subject = 'A new job has been created with Lien Flash'
#       content = Content.new(type: 'text/plain', value:
#         "A new job located at: #{job.job_street} #{job.job_city} #{job.job_state}, #{job.job_zip} has been created using Lien Flash.
# This job has an unpaid balance of $#{job.material_cost + job.labor_cost}.
# In 60 days you will be given the option to create a Letter of Intent to File a Lien.

# Thank you for using Lien Flash!

# Please do not reply to this email. This is a post-only, outbound email. We will be unable to respond to your reply.
# Should you have any questions please reach out to us at: info@lienflash.com
# © 2020 Lien Flash. All Rights Reserved.")
#       mail = SendGrid::Mail.new(from, subject, to, content)
#       sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
#       response = sg.client.mail._('send').post(request_body: mail.to_json)


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
